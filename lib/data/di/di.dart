import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_talk/data/datasource/authentication_datasource.dart';
import 'package:lets_talk/data/datasource/environment_datasource.dart';
import 'package:lets_talk/data/datasource/grammer_datasource.dart';
import 'package:lets_talk/data/repository/authentication_repository.dart';
import 'package:lets_talk/data/repository/environment_repository.dart';
import 'package:lets_talk/data/repository/grammer_repository.dart';
import 'package:lets_talk/util/dio_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  //--components
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  locator.registerSingleton<Dio>(DioProvider.createDio());

  //--datasource
  locator
      .registerFactory<IAuthenticationDatasource>(() => AuthenticationRemote());
  locator
      .registerFactory<IEnvironmentDatasource>(() => EnvironmentDataRemote());
  locator.registerFactory<IGrammerDatasource>(() => GrammerRemote());

  //--repository
  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());
  locator
      .registerFactory<IEnvironmentRepository>(() => EnvironmentRepository());
  locator.registerFactory<IGrammerRepository>(() => GrammerRepository());
}
