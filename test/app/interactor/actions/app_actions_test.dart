// import 'dart:async';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:getapps/app/domain/entities/app_entity.dart';
// import 'package:getapps/app/domain/entities/repository_entity.dart';
// import 'package:getapps/app/interactor/actions/app_actions.dart';
// import 'package:getapps/app/interactor/states/app_state.dart';

// void main() {
//   test('installAppAction', () async {
//     final app = AppEntity.notInstallApp(
//       RepositoryEntity(
//         provider: GitRepositoryProvider.github,
//         organizationName: 'flutter',
//         projectName: 'flutter',
//       ),
//     );

//     final appModel = AppModel(app);
//     expect(
//       appModel.toStream(),
//       emitsInOrder([
//         isA<LoadingAppState>(),
//         DownloadingAppState(app, 0.2),
//         DownloadingAppState(app, 0.4),
//         DownloadingAppState(app, 0.6),
//         DownloadingAppState(app, 0.8),
//         DownloadingAppState(app, 1.0),
//         isA<LoadingAppState>(),
//         isA<InstalledAppState>(),
//       ]),
//     );

//     await installAppAction(appModel, '');
//   });

//   test('cancel installAppAction', () async {
//     final app = AppEntity.notInstallApp(
//       RepositoryEntity(
//         provider: GitRepositoryProvider.github,
//         organizationName: 'flutter',
//         projectName: 'flutter',
//       ),
//     );

//     final appModel = AppModel(app);
//     appModel.addListener(() {
//       if (appModel.state == DownloadingAppState(app, 0.8)) {
//         cancelInstallAppAction();
//       }
//     });

//     expect(
//       appModel.toStream(),
//       emitsInOrder([
//         isA<LoadingAppState>(),
//         DownloadingAppState(app, 0.2),
//         DownloadingAppState(app, 0.4),
//         DownloadingAppState(app, 0.6),
//         DownloadingAppState(app, 0.8),
//         isA<NotInstallAppState>(),
//       ]),
//     );

//     await installAppAction(appModel, '');
//   });

//   // test('dsdsd', () {
//   //   final file = File('./test/icon.png');

//   //   final image = File('./test/iamge_bytes.dart');

//   //   if (image.existsSync()) {
//   //     image.deleteSync();
//   //   }

//   //   image.writeAsStringSync('final imageBytes = [${file.readAsBytesSync().join(', ')}];');
//   // });
// }

// extension AppModelToStream on AppModel {
//   Stream<AppState> toStream() {
//     final controller = StreamController<AppState>();

//     addListener(() {
//       controller.add(state);
//     });

//     return controller.stream;
//   }
// }
