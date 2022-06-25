import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:my_recipe_app/core/api_service/api_service.dart';

class ApiServiceImpl extends ApiService {
  ///we use tasty api for our recipe app
  final String _host = 'https://tasty.p.rapidapi.com';

  ///assign rapid api key
  ///if api request quota exceeded, create a new account to rapidAPI
  ///and generate new rapidApikKey
  final String _rapidApiKey =
      '2b7d0a6156msh77fb967a7549231p1707eejsn5cbc1df01ba6';

  //assign rapid api host
  final String _rapidApiHost = 'tasty.p.rapidapi.com';

  //instantiate dio package
  //use dio package for api http request
  var _dio = Dio();
  var _dioCacheManager =
      DioCacheManager(CacheConfig(baseUrl: 'tasty.p.rapidapi.com'));

  ///search recipe by query and tags
  ///send an api request that will request recipes
  @override
  Future<Response> searchRecipe(
      {required String query, List<String>? tags}) async {
    //put tag list into string, separated by comma
    String? finalTags = tags?.join(',');

    _dio.interceptors.add(_dioCacheManager.interceptor);

    final searchResult = await _dio.get(
      "$_host/recipes/list",
      options: buildCacheOptions(
        Duration(days: 7),
        forceRefresh: true,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Rapidapi-Key': _rapidApiKey,
            'X-Rapidapi-Host': _rapidApiHost,
          },
        ),
      ),
      queryParameters: {
        'q': query,
        'tags': finalTags,
      },
    );
    return searchResult;
  }

  ///get the recipe extended info
  ///send an api request that will get the recipe extended info
  ///get recipe extended info by passing recipe id as param
  @override
  Future<Response> getRecipeInfo({required String recipeId}) async {
    _dio.interceptors.add(_dioCacheManager.interceptor);
    return await _dio.get('$_host//recipes/get-more-info',
        options: buildCacheOptions(
          Duration(days: 7),
          //forceRefresh: true,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'X-Rapidapi-Key': _rapidApiKey,
              'X-Rapidapi-Host': _rapidApiHost,
            },
          ),
        ),
        queryParameters: {
          'id': recipeId,
        });
  }

  ///send an api request that will get the related recipes
  ///get related recipes by passing the recipe id to the params
  @override
  Future<Response> getSimilarRecipes({required String recipeId}) async {
    _dio.interceptors.add(_dioCacheManager.interceptor);
    return await _dio.get('$_host/recipes/list-similarities',
        options: buildCacheOptions(
          Duration(days: 7),
          forceRefresh: true,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'X-Rapidapi-Key': _rapidApiKey,
              'X-Rapidapi-Host': _rapidApiHost,
            },
          ),
        ),
        queryParameters: {
          'recipe_id': recipeId,
        });
  }

  ///get recipes that should be shown on home page view
  ///categorize the feed recipes according to the type i.e 'trending'
  @override
  Future<Response> getFeedRecipes() async {
    _dio.interceptors.add(_dioCacheManager.interceptor);
    return await _dio.get('$_host/feeds/list',
        options: buildCacheOptions(
          Duration(days: 7),
          forceRefresh: true,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'X-Rapidapi-Key': _rapidApiKey,
              'X-Rapidapi-Host': _rapidApiHost,
            },
          ),
        ),
        queryParameters: {
          'size': '1',
          'timezone': '+0800',
          'vegetarian': false,
          'from': '0',
        });
  }

  ///send an api request that will get all tags
  @override
  Future<Response> getFilterTags() async {
    _dio.interceptors.add(_dioCacheManager.interceptor);
    return await _dio.get('$_host/feeds/list',
        options: buildCacheOptions(
          Duration(days: 7),
          forceRefresh: true,
          options: Options(
            receiveTimeout: 5000,
            sendTimeout: 5000,
            headers: {
              'Content-Type': 'application/json',
              'X-Rapidapi-Key': _rapidApiKey,
              'X-Rapidapi-Host': _rapidApiHost,
            },
          ),
        ),
        queryParameters: {
          'size': '1',
          'timezone': '+0800',
          'vegetarian': false,
          'from': '0',
        });
  }
}
