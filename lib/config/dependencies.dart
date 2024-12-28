import 'package:auto_injector/auto_injector.dart';
import 'package:getapps/data/data.dart';
import 'package:getapps/ui/home/view_models/home_viewmodel.dart';

import '../domain/domain.dart';
import '../domain/usecases/register_app_usecase.dart';

final injector = AutoInjector();

void setupInjection() {
  // data
  injector.addSingleton<CodeHostingRepository>(MockCodeHostingRepository.new);
  injector.addSingleton<AppRepository>(MockAppRepository.new);

  // domain
  injector.addLazySingleton(InstallAppUsecase.new);
  injector.addLazySingleton(UninstallAppUsecase.new);
  injector.addLazySingleton(RegisterAppUsecase.new);
  injector.addLazySingleton(HomeViewmodel.new);
  injector.commit();
}
