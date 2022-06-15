// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../models/recipe.dart';
import '../ui/views/main_view/main_view.dart';
import '../ui/views/recipe_info_view/recipe_info_view.dart';
import '../ui/views/search_recipe_view/search_recipe_view.dart';
import '../ui/views/splash_view/splash_view.dart';

class Routes {
  static const String SplashView = '/splash-view';
  static const String RecipeInfoView = '/recipe-info-view';
  static const String mainView = '/main-view';
  static const String SearchRecipeView = '/search-recipe-view';
  static const all = <String>{
    SplashView,
    RecipeInfoView,
    mainView,
    SearchRecipeView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.SplashView, page: SplashView),
    RouteDef(Routes.RecipeInfoView, page: RecipeInfoView),
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.SearchRecipeView, page: SearchRecipeView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    RecipeInfoView: (data) {
      var args = data.getArgs<RecipeInfoViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => RecipeInfoView(
          key: args.key,
          recipe: args.recipe,
        ),
        settings: data,
        maintainState: false,
      );
    },
    MainView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const MainView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.zoomIn,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    SearchRecipeView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SearchRecipeView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// RecipeInfoView arguments holder class
class RecipeInfoViewArguments {
  final Key? key;
  final Recipe recipe;
  RecipeInfoViewArguments({this.key, required this.recipe});
}
