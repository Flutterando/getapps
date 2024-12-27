import 'package:getapps/domain/entities/app_entity.dart';
import 'package:getapps/domain/repositories/app_repository.dart';
import 'package:result_dart/result_dart.dart';

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
