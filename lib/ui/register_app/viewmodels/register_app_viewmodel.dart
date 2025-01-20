import 'package:getapps/domain/domain.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class RegisterAppViewmodel {
  final RegisterAppUsecase _registerAppUsecase;

  RegisterAppViewmodel(this._registerAppUsecase);

  late final registerAppCommand = Command1(_registerApp);

  AsyncResult<AppEntity> _registerApp(String url) async {
    return await _registerAppUsecase.call(url);
  }
}
