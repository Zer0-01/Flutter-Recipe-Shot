import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/local/shared_preferences_helper.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_response.dart';
import 'package:flutter_recipe_shot/models/recipe.dart';

class ProfileViewModel extends ChangeNotifier {
  String userUid = '';
  ApiResponse<List<Recipe>> recipesResponse = ApiResponse.loading();
  List<Recipe> listRecipe = [];

  Future<void> init() async {
    getUserUid();
    await getRecipes();
    load();
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
      _setRecipesResponse(ApiResponse.loading());

      CollectionReference recipesCollection =
          FirebaseFirestore.instance.collection('recipes');

      await recipesCollection.doc(documentId).delete();

      print("success delete");
    } catch (error) {
      print(error.toString());
    }
  }

  void load() {
    listRecipe = recipesResponse.data ?? [];
  }

  void _setRecipesResponse(ApiResponse<List<Recipe>> response) {
    recipesResponse = response;
    notifyListeners();
  }
}
