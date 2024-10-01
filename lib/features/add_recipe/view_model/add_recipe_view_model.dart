import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/local/shared_preferences_helper.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_response.dart';
import 'package:flutter_recipe_shot/models/recipe_update.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class AddRecipeViewModel extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController instructionsController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _imagePicker = ImagePicker();
  XFile? image;
  ApiResponse<RecipeUpdate>? recipeResponse;
  List<String> ingredientsList = [];
  List<String> instructionsList = [];

  Future<void> createRecipe(BuildContext context) async {
    try {
      _setRecipeResponse(ApiResponse.loading());
      String? imageUrl;
      if (image != null) {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference storageReference =
            FirebaseStorage.instance.ref().child('image/$fileName');
        TaskSnapshot uploadTask =
            await storageReference.putFile(File(image!.path));

        imageUrl = await uploadTask.ref.getDownloadURL();
      }

      RecipeUpdate recipeUpdate = RecipeUpdate(
        title: titleController.text,
        description: descriptionController.text,
        ingredients: ingredientsList,
        instructions: instructionsList,
        imageUrl: imageUrl,
        userUid: SharedPreferencesHelper.instance.getUserUid('USERUID') ?? '0',
      );

      Map<String, dynamic> recipeUpdateData = recipeUpdate.toJson();
      DocumentReference recipeDocument =
          await _firestore.collection('recipes').add(recipeUpdateData);

      String documentId = recipeDocument.id;

      await recipeDocument.update({'id': documentId});

      DocumentSnapshot recipeUpdateSnapshot = await recipeDocument.get();
      RecipeUpdate recipe =
          RecipeUpdate.fromJson(recipeUpdateSnapshot.data() as Map<String, dynamic>);
      _setRecipeResponse(ApiResponse.completed(recipe));
      _showSnackbar(context, 'Recipe successfully saved');
    } catch (error) {
      _setRecipeResponse(ApiResponse.error(error.toString()));
      _showSnackbar(context, "Invalid save new recipe. Please try again");
    }
  }

  Future<void> getImage() async {
    image = await _imagePicker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  void addIngredient() {
    if (ingredientsController.text.isNotEmpty) {
      ingredientsList.add(ingredientsController.text);
      ingredientsController.clear();
      notifyListeners();
    }
  }

  void removeIngredient(int index) {
    ingredientsList.removeAt(index);
    notifyListeners();
  }

  void addInstruction() {
    if (instructionsController.text.isNotEmpty) {
      instructionsList.add(instructionsController.text);
      instructionsController.clear();
      notifyListeners();
    }
  }

  void removeInstruction(int index) {
    instructionsList.removeAt(index);
    notifyListeners();
  }

  //private method
  void _setRecipeResponse(ApiResponse<RecipeUpdate> response) {
    print('Response: $response');
    recipeResponse = response;
    notifyListeners();
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.whiteColor,
        content: Text(
          message,
          style: TextStyle(
              color: AppColors.darkGreenColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
