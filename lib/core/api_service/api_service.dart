import 'package:dio/dio.dart';

abstract class ApiService {
  ///search recipe by query and tags
  ///send an api request that will request recipes
  Future<Response> searchRecipe({required String query, List<String>? tags});

  ///get the recipe extended info
  ///send an api request that will get the recipe extended info
  ///get recipe extended info by passing recipe id as param
  Future<Response> getRecipeInfo({required String recipeId});

  ///send an api request that will get the related recipes
  ///get related recipes by passing the recipe id to the params
  Future<Response> getSimilarRecipes({required String recipeId});

  ///get recipes that should be shown on home page view
  ///categorize the feed recipes according to the type i.e 'trending'
  Future<Response> getFeedRecipes();

  ///send an api request that will get all tags
  Future<Response> getFilterTags();
}
