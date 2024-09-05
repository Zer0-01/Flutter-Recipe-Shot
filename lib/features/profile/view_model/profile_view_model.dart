import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/local/shared_preferences_helper.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_response.dart';
import 'package:flutter_recipe_shot/models/recipe.dart';

class ProfileViewModel extends ChangeNotifier {
  String userUid = '';
  ApiResponse<List<Recipe>> recipesResponse = ApiResponse.loading();
  ApiResponse<bool>? deleteRecipeResponse;
  List<Recipe> listRecipe = [];

  Future<void> init() async {
    getUserUid();
    await getRecipes();
  }

  void getUserUid() {
    userUid = SharedPreferencesHelper.instance.getUserUid('USERUID') ?? '';
  }

  Future<void> getRecipes() async {
    try {
      _setRecipesResponse(ApiResponse.loading());

      CollectionReference recipesCollection =
          FirebaseFirestore.instance.collection('recipes');
      QuerySnapshot response =
          await recipesCollection.where('userUid', isEqualTo: userUid).get();
      List<Recipe> value = response.docs
          .map((doc) => Recipe.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      _setRecipesResponse(ApiResponse.completed(value));
    } catch (error) {
      _setRecipesResponse(ApiResponse.error(error.toString()));
    }
  }

  Future<void> deleteRecipe(String documentId) async {
    try {
      _setDeleteRecipeResponse(ApiResponse.loading());

      CollectionReference recipesCollection =
          FirebaseFirestore.instance.collection('recipes');

      await recipesCollection.doc(documentId).delete();

      await getRecipes();
    } catch (error) {
      _setDeleteRecipeResponse(ApiResponse.error(error.toString()));
    }
  }

  void _setRecipesResponse(ApiResponse<List<Recipe>> response) {
    print("Response: $response");
    recipesResponse = response;
    notifyListeners();
  }

  void _setDeleteRecipeResponse(ApiResponse<bool> response) {
    deleteRecipeResponse = response;
    notifyListeners();
  }
}
