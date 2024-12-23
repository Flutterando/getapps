import 'package:getapps/app/app.dart';
import 'package:getapps/app/data/repositories/app_repository.dart';

class UninstallAppUsecase {
  final AppRepository _appRepository;

  UninstallAppUsecase(this._appRepository);

  AsyncResult<AppEntity> call(AppEntity app) async {
    return await _appRepository
        .uninstallApp(app) //
        .flatMap(_appRepository.putApp)
        .map((app) => app.toNotInstalled());
  }
}
