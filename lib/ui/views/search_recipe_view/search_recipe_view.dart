import 'package:flutter/material.dart';
import 'package:my_recipe_app/ui/views/search_recipe_view/search_view_model.dart';
import 'package:my_recipe_app/ui/widgets/recipe_card/recipe_card.dart';
import 'package:stacked/stacked.dart';

class SearchRecipeView extends StatelessWidget {
  const SearchRecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchRecipeViewModel>.reactive(
      viewModelBuilder: () => SearchRecipeViewModel(),
      // onModelReady: (model) => model.searchRecipe(query: ''),
      builder: (context, model, widget) => Scaffold(
        backgroundColor: Colors.green.shade50,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              SizedBox(
                height: 45,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: model.textSearchController,
                        autofocus: true,
                        onSubmitted: (value) => model.searchRecipe(
                          query: value,
                          tags: model.tagsValueList,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search recipes..',
                          constraints:
                              BoxConstraints(minHeight: 45, maxHeight: 45),
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    IconButton(
                      onPressed: () => model.openFilterBottomSheet(),
                      padding: EdgeInsets.zero,
                      icon: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image(
                          image: AssetImage('assets/icons/setting-4.png'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: model.selectedTags.length > 0,
                child: Wrap(
                  runSpacing: 4,
                  spacing: 4,
                  children: model.selectedTags
                      .map((tag) => ChoiceChip(
                            label: Text(
                              tag.displayName,
                              style: TextStyle(color: Colors.white),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            selected: true,
                            selectedColor: Colors.green.shade600,
                          ))
                      .toList(),
                ),
              ),
              Visibility(
                visible: model.resultRecipes.length > 0,
                child: Text(
                  'Results',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              model.isBusy
                  ? Container(
                      height: 500,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.green,
                            backgroundColor: Colors.white,
                          ),
                          Text('Please wait..')
                        ],
                      )),
                    )
                  : model.resultRecipes.length > 0
                      ? GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: model.resultRecipes.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            mainAxisExtent: 265,
                          ),
                          itemBuilder: (context, index) =>
                              RecipeCard(recipe: model.resultRecipes[index]))
                      : Container(
                          height: 500,
                          child: Center(
                              child: Text(
                            'No Recipes Found. Try Another tags or combination',
                            textAlign: TextAlign.center,
                          )),
                        )
            ],
          ),
        ),
      ),
    );
  }
}
