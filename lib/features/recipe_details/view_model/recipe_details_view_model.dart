import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_response.dart';
import 'package:flutter_recipe_shot/models/recipe.dart';

class RecipeDetailsViewModel extends ChangeNotifier {
  ApiResponse<Recipe> recipeResponse = ApiResponse.loading();
  late Recipe recipe;

  Future<void> init(String recipeId) async {
    await _getRecipeDetails(recipeId);
    _load();
    notifyListeners();
  }

//private method
  Future<void> _getRecipeDetails(String recipeId) async {
    try {
      _setRecipeResponse(ApiResponse.loading());

      DocumentReference recipeDocument =
          FirebaseFirestore.instance.collection('recipes').doc(recipeId);

      DocumentSnapshot response = await recipeDocument.get();

      Recipe value = Recipe.fromJson(response.data() as Map<String, dynamic>);

      _setRecipeResponse(ApiResponse.completed(value));
    } catch (error) {
      _setRecipeResponse(ApiResponse.error(error.toString()));
    }
  }

  void _setRecipeResponse(ApiResponse<Recipe> response) {
    print('Response: $response');
    recipeResponse = response;
    notifyListeners();
  }

  void _load() {
    recipe = recipeResponse.data!;
    notifyListeners();
  }
}
