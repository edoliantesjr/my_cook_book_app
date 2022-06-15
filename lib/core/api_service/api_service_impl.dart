import 'package:dio/dio.dart';
import 'package:my_recipe_app/core/api_service/api_service.dart';

class ApiServiceImpl extends ApiService {
  //we use tasty api for our recipe app
  //assign value host
  final String _host = 'https://tasty.p.rapidapi.com';

  //assign rapid api key
  final String _rapidApiKey =
      'f4e3b1be7dmshb369f4e3bb8e6b4p18cbb1jsnff121f4f2b15';

  //assign rapid api host
  final String _rapidApiHost = 'tasty.p.rapidapi.com';

  //instantiate dio package
  //use dio package for api http request
  final _dio = Dio();

  //search recipe by query and tags
  //send an api request that will request recipes
  @override
  Future<Response> searchRecipe(
      {required String query, List<String>? tags}) async {
    //put tag list into string, separated by comma
    String? finalTags = tags?.join(',');

    final searchResult = await _dio.get("$_host/recipes/list",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Rapidapi-Key': _rapidApiKey,
            'X-Rapidapi-Host': _rapidApiHost,
          },
        ),
        queryParameters: {
          'q': query,
          'tags': finalTags,
        });
    return searchResult;
  }

//get the recipe extended info
//send an api request that will get the recipe extended info
//get recipe extended info by passing recipe id as param
  @override
  Future<Response> getRecipeInfo({required String recipeId}) async {
    return await _dio.get('$_host//recipes/get-more-info',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Rapidapi-Key': _rapidApiKey,
            'X-Rapidapi-Host': _rapidApiHost,
          },
        ),
        queryParameters: {
          'id': recipeId,
        });
  }


//send an api request that will get the related recipes
//get related recipes by passing the recipe id to the params
  @override
  Future<Response> getSimilarRecipes({required String recipeId}) async {
    return await _dio.get('$_host/recipes/list-similarities',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Rapidapi-Key': _rapidApiKey,
            'X-Rapidapi-Host': _rapidApiHost,
          },
        ),
        queryParameters: {
          'recipe_id': recipeId,
        });
  }

  //get recipes that should be shown on home page view
  //categorize the feed recipes according to the type i.e 'trending'
  @override
  Future<Response> getFeedRecipes() async {
    return await _dio.get('$_host/feeds/list',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Rapidapi-Key': _rapidApiKey,
            'X-Rapidapi-Host': _rapidApiHost,
          },
        ),
        queryParameters: {
          'size': '1',
          'timezone': '+0800',
          'vegetarian': false,
          'from': '0',
        });
  }


//send an api request that will get all tags
  @override
  Future<Response> getFilterTags() async {
    return await _dio.get('$_host/feeds/list',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Rapidapi-Key': _rapidApiKey,
            'X-Rapidapi-Host': _rapidApiHost,
          },
        ),
        queryParameters: {
          'size': '1',
          'timezone': '+0800',
          'vegetarian': false,
          'from': '0',
        });
  }
}
