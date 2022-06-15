import 'dart:async';

import 'package:my_recipe_app/app/app.locator.dart';
import 'package:my_recipe_app/app/app.router.dart';
import 'package:my_recipe_app/core/api_service/api_service.dart';
import 'package:my_recipe_app/core/connectivity_service/connectivity_service.dart';
import 'package:my_recipe_app/core/navigator_service/navigator_service.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  //locate and access connectivity service
  final connectivityService = locator<ConnectivityService>();

  //locate and access Api service
  final apiService = locator<ApiService>();

  //locate and access Navigator service
  final navigatorService = locator<NavigatorService>();

  void init() async {
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    bool hasInternet = await connectivityService.checkConnectivity();
    await Future.delayed(const Duration(seconds: 2));
    if (hasInternet) {
      navigatorService.popAllAndPushNamed(Routes.mainView);
    }
  }
}
