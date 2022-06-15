import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe_app/models/recipe.dart';
import 'package:my_recipe_app/ui/widgets/recipe_card/recipe_card_view_model.dart';
import 'package:stacked/stacked.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipeCardViewModel>.nonReactive(
      viewModelBuilder: () => RecipeCardViewModel(),
      builder: (context, model, widget) => InkWell(
        key: ObjectKey(this.recipe.id),
        onTap: () => model.openRecipeInfo(recipe: this.recipe),
        child: Container(
          height: 230,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      Container(
                        height: 190,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                recipe.thumbnailUrl!),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(recipe.name!, overflow: TextOverflow.fade),
            ],
          ),
        ),
      ),
    );
  }
}
