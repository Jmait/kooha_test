import 'package:get_it/get_it.dart';
import 'package:kooha_test/core/service/apis/auth_api.dart';
import 'package:kooha_test/core/service/apis/browse_api.dart';
import 'package:kooha_test/core/viewModels/browse_celeb_vm.dart';
import 'package:kooha_test/core/viewModels/login__vm.dart';

GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => BrowseViewModel());
  locator.registerLazySingleton(() => AuthApi());
  locator.registerLazySingleton(() => BrowseCelebApi());
}
