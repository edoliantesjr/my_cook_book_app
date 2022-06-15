import 'package:my_recipe_app/models/recipe.dart';

class Featured {
  String? type;
  String? name;
  String? category;
  int? minItems;
  List<Recipe>? recipes;

  Featured({this.type, this.name, this.category, this.minItems, this.recipes});

  Featured.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    category = json['category'];
    minItems = json['min_items'];
    json['items'];
    if (json['items'] != null) {
      recipes = List<Recipe>.from(
          json['items'].map((recipe) => Recipe.fromJson(recipe)).toList());
    }
  }
}
