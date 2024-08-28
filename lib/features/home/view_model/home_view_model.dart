import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/local/shared_preferences_helper.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_response.dart';
import 'package:flutter_recipe_shot/features/add_recipe/view/add_recipe_view.dart';
import 'package:flutter_recipe_shot/features/recipe_details/view/recipe_details_view.dart';
import 'package:flutter_recipe_shot/features/recipes/view/recipes_view.dart';
import 'package:flutter_recipe_shot/features/signIn/view/signin_view.dart';
import 'package:flutter_recipe_shot/models/recipe.dart';

class HomeViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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

  void toRecipesView(BuildContext context) {
    Navigator.pushNamed(context, RecipesView.id);
  }

  void toMyRecipesView(BuildContext context) {
    Navigator.pushNamed(context, RecipesView.id);
  }

  void toRecipeDetailsView(BuildContext context, Recipe recipe) {
    Navigator.pushNamed(context, RecipeDetailsView.id, arguments: recipe.id);
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await SharedPreferencesHelper.instance.clear();
      await _auth.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged out successfully'),
          backgroundColor: Colors.green,
        ),
      );
      // Navigate to login screen or home screen after logout
      Navigator.of(context).pushReplacementNamed(SigninView.id); //
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error logging out: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void toAddRecipeView(BuildContext context) {
    Navigator.pushNamed(context, AddRecipeView.id);
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
