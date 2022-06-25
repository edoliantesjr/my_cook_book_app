import 'package:my_recipe_app/core/api_service/api_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../core/navigator_service/navigator_service.dart';
import '../../../models/recipe.dart';

class RecipeInfoViewModel extends BaseViewModel {
//
  final apiService = locator<ApiService>();
  final navigatorService = locator<NavigatorService>();

  List<Recipe> relatedRecipes = [];

  Future<void> getRelatedRecipe(String id) async {
    setBusy(true);
    final queryResult = await apiService.getSimilarRecipes(recipeId: id);

    //add recipe to relatedRecipeList according to result length
    final recipes = queryResult.data['results']
        .map((json) => Recipe.fromJson(json))
        .toList();
    relatedRecipes.clear();
    relatedRecipes.addAll(List<Recipe>.from(recipes));
    relatedRecipes;
    setBusy(false);

    notifyListeners();
  }
}
