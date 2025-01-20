import 'package:getapps/domain/domain.dart';
import 'package:result_dart/result_dart.dart';

class AddThisAppInformation {
  final AppRepository _appRepository;
  final CodeHostingRepository _codeHostingRepository;

  AddThisAppInformation(this._appRepository, this._codeHostingRepository);

  AsyncResult<Unit> call() async {
    final getapps = AppEntity.thisAppEntity();

    return _checkExistApp(getapps) //
        .flatMap(_appRepository.addInfo)
        .flatMap(_codeHostingRepository.getLastRelease)
        .map((app) => app.copyWith(currentRelease: app.lastRelease))
        .flatMap(_appRepository.putApp)
        .pure(unit);
  }

  AsyncResult<AppEntity> _checkExistApp(AppEntity app) async {
    return _appRepository //
        .fetchApps()
        .flatMap((apps) {
      if (apps.indexWhere((element) => element.packageInfo.id == app.packageInfo.id) == -1) {
        return Success(app);
      } else {
        return Failure(Exception('App has added'));
      }
    });
  }
}
