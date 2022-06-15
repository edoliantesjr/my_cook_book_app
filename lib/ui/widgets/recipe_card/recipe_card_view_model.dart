import 'package:flutter/cupertino.dart';
import 'package:my_recipe_app/app/app.locator.dart';
import 'package:my_recipe_app/app/app.router.dart';
import 'package:my_recipe_app/core/navigator_service/navigator_service.dart';
import 'package:my_recipe_app/models/recipe.dart';
import 'package:stacked/stacked.dart';

class RecipeCardViewModel extends BaseViewModel {
  //locate and access navigatorService
  final navigatorService = locator<NavigatorService>();

  // this method will fire when tapping the recipe card
  Future<void> openRecipeInfo({required Recipe recipe}) async {
    //tried pushNamed but everytime I call the same page to the stak, the page
    //was not added to the stack
    await navigatorService.pushNamedAndRemoveUntil(
      Routes.RecipeInfoView,
      arguments: RecipeInfoViewArguments(
          recipe: recipe, key: Key(recipe.id.toString())),
      predicate: (Route<dynamic> route) => true,
    );
  }
}
