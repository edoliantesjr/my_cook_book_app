import 'package:my_recipe_app/core/api_service/api_service.dart';
import 'package:my_recipe_app/core/api_service/api_service_impl.dart';
import 'package:my_recipe_app/core/connectivity_service/connectivity_service.dart';
import 'package:my_recipe_app/core/navigator_service/navigator_service.dart';
import 'package:my_recipe_app/core/navigator_service/navigator_service_impl.dart';
import 'package:my_recipe_app/ui/views/main_view/main_view.dart';
import 'package:my_recipe_app/ui/views/recipe_info_view/recipe_info_view.dart';
import 'package:my_recipe_app/ui/views/search_recipe_view/search_recipe_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/splash_view/splash_view.dart';

@StackedApp(
  //run command - flutter pub run build_runner build --delete-conflicting-outputs
  //to generate generated files for routing and dependency

  routes: [
    //here you add your routes that has to be generated
    //on onGenerateRoute function

    //Material Route- defines the default animation for opening/closing a screen
    //also set the name and arguments
    MaterialRoute(page: SplashView, name: 'SplashView'),
    MaterialRoute(
      page: RecipeInfoView,
      name: 'RecipeInfoView',
      maintainState: false,
    ),

    // Custom Route, use custom animation for opening/closing screen
    CustomRoute(
      page: MainView,
      transitionsBuilder: TransitionsBuilders.zoomIn,
      durationInMilliseconds: 300,
    ),

    CustomRoute(
      page: SearchRecipeView,
      name: 'SearchRecipeView',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),
  ],
  dependencies: [
    //here you register your app dependencies
    LazySingleton(classType: ApiServiceImpl, asType: ApiService),
    LazySingleton(classType: NavigatorServiceImpl, asType: NavigatorService),
    LazySingleton(classType: ConnectivityService),
  ],
)
class App {}
