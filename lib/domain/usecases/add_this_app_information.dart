import 'package:getapps/domain/domain.dart';
import 'package:result_dart/result_dart.dart';

class AddThisAppInformation {
  final AppRepository _appRepository;
  final CodeHostingRepository _codeHostingRepository;

  AddThisAppInformation(this._appRepository, this._codeHostingRepository);

  AsyncResult<Unit> call() async {
    final getapps = AppEntity.thisAppEntity();

    return _appRepository //
        .putApp(getapps)
        .flatMap(_appRepository.addInfo)
        .flatMap(_codeHostingRepository.getLastRelease)
        .flatMap(_appRepository.putApp)
        .pure(unit);
  }
}
