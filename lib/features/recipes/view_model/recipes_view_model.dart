import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_response.dart';
import 'package:flutter_recipe_shot/features/add_recipe/view/add_recipe_view.dart';
import 'package:flutter_recipe_shot/features/recipe_details/view/recipe_details_view.dart';
import 'package:flutter_recipe_shot/models/recipe.dart';

class RecipesViewModel extends ChangeNotifier {
  ApiResponse<List<Recipe>> recipesResponse = ApiResponse.loading();
  List<Recipe> listRecipe = [];

  Future<void> init() async {
    await getRecipes();
    _load();
  }

  Future<void> getRecipes() async {
    try {
      _setRecipesResponse(ApiResponse.loading());

      CollectionReference recipesCollection =
          FirebaseFirestore.instance.collection('recipes');

      QuerySnapshot response = await recipesCollection.get();

      List<Recipe> value = response.docs
          .map((doc) => Recipe.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      _setRecipesResponse(ApiResponse.completed(value));
    } catch (error) {
      _setRecipesResponse(ApiResponse.error(error.toString()));
    }
  }

  void toAddRecipeView(BuildContext context) {
    Navigator.pushNamed(context, AddRecipeView.id);
  }

  void toRecipeDetailsView(BuildContext context, Recipe recipe) {
    Navigator.pushNamed(context, RecipeDetailsView.id, arguments: recipe.id);
  }

  //private method
  void _setRecipesResponse(ApiResponse<List<Recipe>> response) {
    print('Response: $response');
    recipesResponse = response;
    notifyListeners();
  }

  void _load() {
    listRecipe = recipesResponse.data ?? [];
  }
}
