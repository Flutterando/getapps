import 'package:getapps/app/(public)/home/view_models/home_viewmodel.dart';
import 'package:getapps/app/app.dart';
import 'package:getapps/app/data/repositories/app_repository.dart';
import 'package:getapps/app/data/repositories/code_hosting_repository.dart';

final injector = AutoInjector();

void setupInjection() {
  // data
  injector.addSingleton<CodeHostingRepository>(MockCodeHostingRepository.new);
  injector.addSingleton<AppRepository>(MockAppRepository.new);

  // domain
  injector.add(InstallAppUsecase.new);
  injector.add(UnimplementedError.new);
  injector.addSingleton(HomeViewmodel.new);
  injector.commit();
}
