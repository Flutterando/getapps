package com.example.android_package

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.content.pm.PackageManager
import android.content.Context
import java.io.ByteArrayOutputStream
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.util.Log
import androidx.core.content.FileProvider
import java.io.File

class AndroidPackagePlugin: FlutterPlugin, MethodCallHandler {

  private lateinit var channel : MethodChannel
  private lateinit var applicationContext: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_package")
    channel.setMethodCallHandler(this)
    applicationContext = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "openApp") {
      result.success(openAppByPackageId(call.arguments<String>()!!))
    } else if (call.method == "installApp") {
      result.success(installAPK(call.arguments<String>()!!))
    } else if (call.method == "uninstallApp") {
      result.success(uninstallAppByPackageId(call.arguments<String>()!!))
    } else if (call.method == "getInfoById") {
      val packageId = call.arguments<String>()!!;
      val info = getAppInfo(packageId)
      result.success(info)
    } else if (call.method == "getAPKInfo") {
      val apkFilePath = call.arguments<String>()!!;
      val info = getAPKInfo(apkFilePath)
      result.success(info)
    } else {
      result.notImplemented()
    }
  }

  private fun openAppByPackageId(packageId: String): Boolean {
    return try {
      val launchIntent: Intent? = applicationContext.packageManager.getLaunchIntentForPackage(packageId)
      if (launchIntent != null) {
        applicationContext.startActivity(launchIntent)
        true
      } else {
        false
      }
    } catch (e: Exception) {
      false
    }
  }

  private fun getAppInfo(packageId: String): Map<String, Any?>? {
    val packageManager = applicationContext.packageManager
    return try {
      val packageInfo = packageManager.getPackageInfo(packageId, 0)
      val appName = packageManager.getApplicationLabel(packageInfo.applicationInfo).toString()
      val appIconBitmap  = packageManager.getApplicationIcon(packageId).toBitmap()
      val appIconBytes = appIconBitmap.toByteArray()
      val appVersion = packageInfo.versionName
      mapOf(
        "name" to appName,
        "packageId" to packageId,
        "icon" to appIconBytes,
        "version" to appVersion
      )
    } catch (e: PackageManager.NameNotFoundException) {
      return null;
    }
  }

  private fun getAPKInfo(apkFilePath: String): Map<String, Any?>? {
    val packageManager = applicationContext.packageManager
    return try {
      val packageInfo = packageManager.getPackageArchiveInfo(apkFilePath, PackageManager.GET_ACTIVITIES)
      packageInfo?.applicationInfo?.let {
        it.sourceDir = apkFilePath
        it.publicSourceDir = apkFilePath

        val appName = packageManager.getApplicationLabel(it).toString()
        val appIcon = packageManager.getApplicationIcon(it).toBitmap().toByteArray()
        val appVersion = packageInfo.versionName

        mapOf(
          "name" to appName,
          "packageId" to packageInfo.packageName,
          "icon" to appIcon,
          "version" to appVersion
        )
      } ?: emptyMap()
    } catch (e: Exception) {
        return null;
    }
  }

  private fun installAPK( apkFilePath: String): Boolean {
    return try {
      val apkFile = File(apkFilePath)
      if (!apkFile.exists()) {
        return false
      }

      val apkUri: Uri = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
        FileProvider.getUriForFile(
          applicationContext,
          "${applicationContext.packageName}.fileprovider",
          apkFile
        )
      } else {
        Uri.fromFile(apkFile)
      }

      val intent = Intent(Intent.ACTION_VIEW).apply {
        setDataAndType(apkUri, "application/vnd.android.package-archive")
        flags = Intent.FLAG_ACTIVITY_NEW_TASK
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
          addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        }
      }
      Log.d("InstallAPK", "APK File Path: $apkUri")
      applicationContext.startActivity(intent)
      true
    } catch (e: Exception) {
      e.printStackTrace()
      false
    }
  }

  fun uninstallAppByPackageId(packageId: String): Boolean {
    return try {
      val uri = Uri.parse("package:$packageId")
      val intent = Intent(Intent.ACTION_DELETE, uri).apply {
        flags = Intent.FLAG_ACTIVITY_NEW_TASK
      }
      applicationContext.startActivity(intent)
      true
    } catch (e: Exception) {
      e.printStackTrace()
      false
    }
  }


  fun android.graphics.drawable.Drawable.toBitmap(): android.graphics.Bitmap {
    if (this is android.graphics.drawable.BitmapDrawable) {
      return this.bitmap
    }
    val bitmap = android.graphics.Bitmap.createBitmap(
      this.intrinsicWidth,
      this.intrinsicHeight,
      android.graphics.Bitmap.Config.ARGB_8888
    )
    val canvas = android.graphics.Canvas(bitmap)
    this.setBounds(0, 0, canvas.width, canvas.height)
    this.draw(canvas)
    return bitmap
  }

  fun android.graphics.Bitmap.toByteArray(): ByteArray {
    val outputStream = ByteArrayOutputStream()
    this.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, outputStream)
    return outputStream.toByteArray()
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
