import 'recipe.dart';

class Recipes {
  final List<Recipe> recipes;

  Recipes({required this.recipes});

  // Factory constructor to create a Recipes from a JSON map
  factory Recipes.fromJson(Map<String, dynamic> json) {
    return Recipes(
      recipes: List<Recipe>.from(
        json['recipes'].map((recipe) => Recipe.fromJson(recipe)),
      ),
    );
  }

  // Method to convert a Recipes instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'recipes': recipes.map((recipe) => recipe.toJson()).toList(),
    };
  }
}
