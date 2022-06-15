import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_recipe_app/app/app.locator.dart';
import 'package:my_recipe_app/core/api_service/api_service.dart';
import 'package:my_recipe_app/models/recipe.dart';
import 'package:my_recipe_app/models/tag.dart';
import 'package:stacked/stacked.dart';

import '../../../core/navigator_service/navigator_service.dart';

class SearchRecipeViewModel extends BaseViewModel {
//

  final textSearchController = TextEditingController();

  //loate anad use the api service dependency
  final apiService = locator<ApiService>();

  //loate anad use the api service dependency
  final navigatorService = locator<NavigatorService>();

  List<Recipe> resultRecipes = [];

  //this will dispose cotrollers when the model was also disposed
  //to avoid memory leaks
  @override
  void dispose() {
    textSearchController.dispose();
    super.dispose();
  }

  //we'll temporary use mock tags
  List<Tag> mockTags = [
    Tag(displayName: 'Easy', value: 'easy'),
    Tag(displayName: 'Under 30 Minutes', value: 'under_30_minutes'),
    Tag(displayName: 'Dinner', value: 'dinner'),
    Tag(displayName: 'Snacks', value: 'snacks'),
    Tag(displayName: 'Filipino', value: 'filipino'),
    Tag(displayName: 'Drinks', value: 'drinks'),
    Tag(displayName: 'Italian', value: 'italian'),
    Tag(displayName: 'Vegetarian', value: 'vegetarian'),
    Tag(displayName: 'Cake Pan', value: 'cake_pan'),
  ];

  List<Tag> selectedTags = [];

  List<String> tagsValueList = [];

  void searchRecipe({required String query, List<String>? tags}) async {
    //
    tags;
    setBusy(true);
    resultRecipes.clear();
    final queryResult = await apiService.searchRecipe(
        query: query.trim(), tags: tags != null ? tags : []);

    final recipeResult = queryResult.data['results'];

    final recipes = recipeResult.map((json) => Recipe.fromJson(json)).toList();

    resultRecipes.addAll(List<Recipe>.from(recipes));
    setBusy(false);
    notifyListeners();
  }

  void openFilterBottomSheet() async {
    Get.bottomSheet(
      Container(
        height: 500,
        padding: EdgeInsets.all(10),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter by',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Text(
              'Category',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: mockTags
                  .map((tag) => ChoiceChip(
                        label: Text(
                          tag.displayName,
                          style: TextStyle(color: Colors.white),
                        ),
                        selected: selectedTags.contains(tag),
                        selectedColor: Colors.green.shade600,
                        onSelected: (bol) async {
                          addTag(tag);
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: false,
    );
  }

  void addTag(Tag tag) {
    if (selectedTags
        .where((element) => element.value == tag.value)
        .isNotEmpty) {
      //remove tag if exist
      selectedTags.remove(tag);
      tagsValueList.remove(tag.value);
      notifyListeners();
    } else {
      //remove tag if not exist
      selectedTags.add(tag);
      notifyListeners();
    }
    navigatorService.pop();

    //get tag value and pass to list<string> tags
    tagsValueList = selectedTags.map((tag) => tag.value).toList();

    //search according ot query and tag
    searchRecipe(query: textSearchController.text, tags: tagsValueList);
  }
}
