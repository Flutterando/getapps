import 'package:getapps/domain/domain.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class SplashViewmodel {
  SplashViewmodel(this.addThisAppInformation);
  final AddThisAppInformation addThisAppInformation;

  late final addThisAppInformationCommand = Command0(_addAppInformation);

  AsyncResult<Unit> _addAppInformation() {
    return addThisAppInformation();
  }
}
