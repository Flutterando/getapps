import 'dart:io';

import 'package:android_package/android_package.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:uno/uno.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String _platformVersion = 'Unknown';
  final _androidPackagePlugin = AndroidPackage();

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () async {
                final info = await _androidPackagePlugin.uninstallApp('br.com.flutterando.yuno');
                print(info);
              },
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () async {
                if (!await _androidPackagePlugin.checkAndRequestInstallPermission()) {
                  return;
                }

                final tempDir = await pp.getTemporaryDirectory();
                final file = File('${tempDir.path}/app-prod-release.apk');

                if (!file.existsSync()) {
                  print('donwloaindg...');
                  final response = await Uno().get(
                    'https://github.com/Flutterando/yuno/releases/download/build-24/app-prod-release.apk',
                    responseType: ResponseType.arraybuffer,
                    onDownloadProgress: (total, current) {
                      print('TOTAL: $total, CURRENT: $current');
                    },
                  );

                  print('DOWNLOADED!!');

                  await file.writeAsBytes(response.data);
                }

                print(file.path);
                final info = await _androidPackagePlugin.installApp(file.path);
                print(info);
              },
              child: const Icon(Icons.download),
            ),
          ],
        ),
      ),
    );
  }
}
