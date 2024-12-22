import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_response.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/models/add_recipe_model.dart';

class AddRecipeViewModel extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();

  TextEditingController get titleController => _titleController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get ingredientsController => _ingredientsController;
  TextEditingController get instructionsController => _instructionsController;

  set titleController(TextEditingController value) {
    _titleController.text = value.text;
    notifyListeners();
  }

  set descriptionController(TextEditingController value) {
    _descriptionController.text = value.text;
    notifyListeners();
  }

  set ingredientsController(TextEditingController value) {
    _ingredientsController.text = value.text;
    notifyListeners();
  }

  set instructionsController(TextEditingController value) {
    _instructionsController.text = value.text;
    notifyListeners();
  }

  ApiResponse<AddRecipeModel>? addRecipeResponse;

  void _setAddRecipeResponse(ApiResponse<AddRecipeModel> response) {
    print("Response: $response");
    addRecipeResponse = response;
    notifyListeners();
  }

  Future<void> addRecipe() async {
    AddRecipeModel recipe = AddRecipeModel(
      title: _titleController.text,
      description: _descriptionController.text,
      ingredients: _ingredientsController.text,
      instructions: _instructionsController.text,
    );

    try {
      _setAddRecipeResponse(ApiResponse.loading());
      await Future.delayed(const Duration(seconds: 2));
      await firestore.collection('recipes').add(recipe.toMap());
      _setAddRecipeResponse(ApiResponse.completed(recipe));
      if (addRecipeResponse?.status == ApiStatus.COMPLETED) {
        _titleController.clear();
        _descriptionController.clear();
        _ingredientsController.clear();
        _instructionsController.clear();
      }
    } catch (e) {
      _setAddRecipeResponse(ApiResponse.error(e.toString()));
    }
  }
}
