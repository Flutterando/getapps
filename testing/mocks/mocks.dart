import 'package:getapps/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class AppRepositoryMock extends Mock implements AppRepository {}

class CodeHostingRepositoryMock extends Mock implements CodeHostingRepository {}

class InstallAppUsecaseMock extends Mock implements InstallAppUsecase {}

class UninstallAppUsecaseMock extends Mock implements UninstallAppUsecase {}

class RegisterAppUsecaseMock extends Mock implements RegisterAppUsecase {}
