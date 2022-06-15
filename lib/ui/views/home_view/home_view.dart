import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_recipe_app/ui/views/home_view/home_view_model.dart';
import 'package:my_recipe_app/ui/widgets/recipe_card/recipe_card.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, widget) => Scaffold(
        appBar: AppBar(
          title: Text('Hello Guest!'),
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
          ),
          backgroundColor: Colors.green.shade50,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: double.maxFinite,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.orange.shade200,
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/default_profile.png'))),
              ),
            )
          ],
        ),
        backgroundColor: Colors.green.shade50,
        body: ListView(
          padding: EdgeInsets.all(18),
          primary: true,
          children: [
            Text('What are you looking for today?'),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () => model.goToSearchView(),
              child: SizedBox(
                height: 45,
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: 'Search recipes..',
                    constraints: BoxConstraints(minHeight: 45, maxHeight: 45),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            model.isBusy
                ? Center(
                    child: Container(
                      height: 500,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : ListView.separated(
                    //should not use listview with shrinkwrap
                    //not efficient, this is temporary only
                    key: ObjectKey(model.feedRecipeSection),
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, featureIndex) => Column(
                      key: ObjectKey(model.feedRecipeSection[featureIndex]),
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.feedRecipeSection[featureIndex].name ??
                              'Featured',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          height: 265,
                          child: ListView.separated(
                            //should not use listview with shrinkwrap
                            //not efficient, this is temporary only
                            shrinkWrap: true,
                            primary: false,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: model.feedRecipeSection[featureIndex]
                                .recipes!.length,
                            itemBuilder: (context, index) => RecipeCard(
                              key: ObjectKey(model
                                  .feedRecipeSection[featureIndex]
                                  .recipes?[index]),
                              recipe: model.feedRecipeSection[featureIndex]
                                  .recipes![index],
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 4),
                          ),
                        ),
                      ],
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 2),
                    itemCount: model.feedRecipeSection.length,
                  )
          ],
        ),
      ),
    );
  }
}
