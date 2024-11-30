import 'package:getapps/app/core/core.dart';
import 'package:getapps/app/data/data.dart';
import 'package:getapps/app/interactor/interactor.dart';

final injector = AutoInjector();

void setupInjection() {
  injector.addSingleton<CodeHostingService>(MockCodeHostingService.new);
  injector.addSingleton<AppLocalStorageService>(MockAppLocalStorageService.new);
  injector.addSingleton<PackageService>(MockPackageService.new);
  injector.commit();
}
