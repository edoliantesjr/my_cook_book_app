import 'package:dio/dio.dart';

abstract class ApiService {
  Future<Response> searchRecipe({required String query, List<String>? tags});

  Future<Response> getRecipeInfo({required String recipeId});

  Future<Response> getSimilarRecipes({required String recipeId});

  Future<Response> getFeedRecipes();

  Future<Response> getFilterTags();
}
