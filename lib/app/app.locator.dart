// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked_core/stacked_core.dart';

import '../core/api_service/api_service.dart';
import '../core/api_service/api_service_impl.dart';
import '../core/connectivity_service/connectivity_service.dart';
import '../core/navigator_service/navigator_service.dart';
import '../core/navigator_service/navigator_service_impl.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl());
  locator.registerLazySingleton<NavigatorService>(() => NavigatorServiceImpl());
  locator.registerLazySingleton(() => ConnectivityService());
}
