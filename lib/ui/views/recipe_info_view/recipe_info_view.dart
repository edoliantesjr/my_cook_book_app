import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_recipe_app/ui/views/recipe_info_view/recipe_info_view_model.dart';
import 'package:my_recipe_app/ui/widgets/recipe_card/recipe_card.dart';
import 'package:stacked/stacked.dart';

import '../../../models/recipe.dart';

class RecipeInfoView extends StatelessWidget {
  final Recipe recipe;
  const RecipeInfoView({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipeInfoViewModel>.reactive(
      viewModelBuilder: () => RecipeInfoViewModel(),
      onModelReady: (model) => model.getRelatedRecipe(recipe.id.toString()),
      builder: (context, model, widget) => Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('Recipe Information'),
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
          ),
          backgroundColor: Colors.grey.shade50,
          elevation: 0,
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            //
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black]),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      opacity: 0.8,
                      image: CachedNetworkImageProvider(recipe.thumbnailUrl!),
                    ),
                  ),
                ),
                Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color: Colors.orange,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            recipe.userRatings?.countPositive.toString() ?? '0',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    left: 10,
                    bottom: 6,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      color: Colors.black26,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/icons/timer.png'),
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${recipe.totalTimeMinutes != null && recipe.totalTimeMinutes < 30 ? ''
                                'under 30 mins.' : 'above 30 mins.'}',
                            style: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(height: 10),
            Text(
              recipe.name ?? 'Recipe name not  set',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 15),

            Container(
              color: Colors.grey.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Related Recipes',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    height: 265,
                    child: model.isBusy
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                Text('Fetching related recipes')
                              ],
                            ),
                          )
                        : ListView.separated(
                            //should not use listview with shrinkwrap
                            //not efficient, this is temporary only
                            shrinkWrap: true,
                            primary: false,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: model.relatedRecipes.length,
                            itemBuilder: (context, index) => RecipeCard(
                              key: ObjectKey(model.relatedRecipes[index]),
                              recipe: model.relatedRecipes[index],
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 4),
                          ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ingredients',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Servings: ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: '${recipe.numServings} ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ]),
                ),
              ],
            ),
            SizedBox(height: 8),
            ListView.separated(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recipe.sections![0].components!.length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        ' ${recipe.sections![0].components![index].ingredient?.name?.toUpperCase() ?? ' '}'),
                    Text(
                      '${recipe.sections![0].components![index].measurements![0].quantity == '0' ? ' '
                          '' : '${recipe.sections![0].components![index].measurements![0].quantity}'}'
                      ' ${recipe.sections![0].components![index].measurements![0].unit?.abbreviation == '0' ? ''
                          '' : '${recipe.sections![0].components![index].measurements![0].unit?.name}'}',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 4),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Procedures',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('${recipe.instructions?.length} steps ')
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recipe.instructions?.length ?? 0,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text:
                              'Step ${recipe.instructions?[index].position}\n',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade900,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  '${recipe.instructions?[index].displayText}',
                              style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 0.5,
                                height: 1.5,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade900,
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 8),
            ),
          ],
        ),
      ),
    );
  }
}
