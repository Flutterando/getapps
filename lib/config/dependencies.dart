import 'package:android_package/android_package.dart';
import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';
import 'package:getapps/data/repositories/app/android_app_repository.dart';
import 'package:getapps/data/services/client_http.dart';
import 'package:getapps/data/services/local_storage.dart';
import 'package:getapps/ui/home/view_models/home_viewmodel.dart';

import '../data/repositories/app/remote_code_hosting_repository.dart';
import '../domain/domain.dart';
import '../domain/usecases/add_this_app_information.dart';
import '../ui/register_app/viewmodels/register_app_viewmodel.dart';

final injector = AutoInjector();

void setupInjection() {
  // data
  injector.addInstance<Dio>(Dio());
  injector.addInstance<AndroidPackage>(AndroidPackage());
  injector.addSingleton(ClientHttp.new);
  injector.addSingleton(LocalStorage.new);
  injector.addSingleton<CodeHostingRepository>(RemoteCodeHostingRepository.new);
  injector.addSingleton<AppRepository>(AndroidAppRepository.new);

  // domain
  injector.addLazySingleton(InstallAppUsecase.new);
  injector.addLazySingleton(UninstallAppUsecase.new);
  injector.addLazySingleton(AddThisAppInformation.new);
  injector.addLazySingleton(RegisterAppUsecase.new);

  // ui
  injector.addLazySingleton(HomeViewmodel.new);
  injector.addLazySingleton(RegisterAppViewmodel.new);

  injector.commit();
}
