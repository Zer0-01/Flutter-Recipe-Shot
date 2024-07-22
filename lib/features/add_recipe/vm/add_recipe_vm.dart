import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_response.dart';
import 'package:flutter_recipe_shot/models/recipe.dart';
import 'package:flutter_recipe_shot/models/recipeUpdate.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class AddRecipeVm extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ApiResponse<Recipe>? recipeResponse;

  void _setRecipeResponse(ApiResponse<Recipe> response) {
    print('Response: $response');
    recipeResponse = response;
    notifyListeners();
  }

  Future<void> createRecipe(BuildContext context) async {
    try {
      _setRecipeResponse(ApiResponse.loading());
      RecipeUpdate recipeUpdate = RecipeUpdate(
          title: titleController.text, description: descriptionController.text);

      Map<String, dynamic> recipeUpdateData = recipeUpdate.toJson();
      DocumentReference recipeDocument =
          await _firestore.collection('recipes').add(recipeUpdateData);

      String documentId = recipeDocument.id;
      print(documentId);

      await recipeDocument.update({'id': documentId});

      DocumentSnapshot recipeSnapshot = await recipeDocument.get();
      Recipe recipe =
          Recipe.fromJson(recipeSnapshot.data() as Map<String, dynamic>);
      _setRecipeResponse(ApiResponse.completed(recipe));
      _showSnackbar(context, 'Recipe successfully saved');
    } catch (error) {
      _setRecipeResponse(ApiResponse.error(error.toString()));
      _showSnackbar(context, "Invalid save new recipe. Please try again");
    }
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.whiteColor,
        content: Text(message, style: TextStyle(color: AppColors.darkGreenColor,  fontWeight: FontWeight.bold),),
      ),
    );
  }
}