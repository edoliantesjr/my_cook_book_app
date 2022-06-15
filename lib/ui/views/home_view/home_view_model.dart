import 'package:my_recipe_app/app/app.locator.dart';
import 'package:my_recipe_app/app/app.router.dart';
import 'package:my_recipe_app/core/api_service/api_service.dart';
import 'package:my_recipe_app/core/connectivity_service/connectivity_service.dart';
import 'package:my_recipe_app/core/navigator_service/navigator_service.dart';
import 'package:my_recipe_app/models/featured.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  //

  final navigatorService = locator<NavigatorService>();
  final apiService = locator<ApiService>();
  final connectivityService = locator<ConnectivityService>();

  List<Featured> feedRecipeSection = [];

  void init() async {
    //
    setBusy(true);
    await getFeedRecipes();
    setBusy(false);
  }

  Future<void> getFeedRecipes() async {
    //pass the query result value
    final queryResult = await apiService.getFeedRecipes();
    feedRecipeSection.clear();

    queryResult.data['results'].forEach((json) {
      //here we only want to get the feed recipes with
      //'carousel' as the type
      if (json['type'] == 'carousel') {
        feedRecipeSection.add(Featured.fromJson(json));
      }
    });
  }

//this method will be fired when tapping the search text field
  void goToSearchView() {
    navigatorService.pushNamed(Routes.SearchRecipeView);
  }
}
