package com.example.android_package

import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.content.pm.PackageInstaller
import android.content.pm.PackageManager
import android.os.Build
import android.util.Log
import java.io.File
import java.io.FileInputStream
import java.io.IOException
import android.net.Uri
import android.provider.Settings

class APKInstaller(private val context: Context) {

    fun installAPK(apkFilePath: String): Boolean {
        return try {
            val session = createSession()
            loadAPKFile(apkFilePath, session)
            commitSession(session)
            true
        } catch (e: Exception) {
            Log.e("APKInstaller", "Error installing APK: ${e.message}")
            false
        }
    }

    fun checkAndRequestInstallPermission(): Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            if (!context.packageManager.canRequestPackageInstalls()) {
                val intent = Intent(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES).apply {
                    data = Uri.parse("package:${context.packageName}")
                    flags = Intent.FLAG_ACTIVITY_NEW_TASK
                }
                context.startActivity(intent)
                return false
            }
        }
        return true
    }

    private fun createSession(): PackageInstaller.Session {
        val packageManager = context.packageManager
        val packageInstaller = packageManager.packageInstaller
        val params = PackageInstaller.SessionParams(PackageInstaller.SessionParams.MODE_FULL_INSTALL)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            params.setInstallReason(PackageManager.INSTALL_REASON_USER)
        }

        val sessionId = packageInstaller.createSession(params)
        return packageInstaller.openSession(sessionId)
    }

    @Throws(IOException::class)
    private fun loadAPKFile(apkPath: String, session: PackageInstaller.Session) {
        val fileName = File(apkPath).name
        session.openWrite(fileName, 0, -1).use { output ->
            FileInputStream(apkPath).use { input ->
                val buffer = ByteArray(16384)
                var bytesRead: Int
                while (input.read(buffer).also { bytesRead = it } != -1) {
                    output.write(buffer, 0, bytesRead)
                }
                output.flush()
            }
        }
    }

    private fun commitSession(session: PackageInstaller.Session) {
        val intent = Intent(context, context.javaClass)
        intent.action = "com.example.android_package.INSTALL_COMPLETE"

        val pendingIntent = PendingIntent.getActivity(
            context,
            0,
            intent,
            PendingIntent.FLAG_MUTABLE
        )

        session.commit(pendingIntent.intentSender)
        session.close()
        Log.d("APKInstaller", "Session committed successfully.")
    }
}
