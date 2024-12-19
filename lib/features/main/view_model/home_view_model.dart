import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/local/shared_preference_key.dart';
import 'package:flutter_recipe_shot/data/local/shared_preferences_helper.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_response.dart';
import 'package:flutter_recipe_shot/models/recipe.dart';

class HomeViewModel extends ChangeNotifier {
  ApiResponse<List<Recipe>> recipeResponse = ApiResponse.loading();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String _userName = "";

  String get userName {
    return _userName;
  }

  set userName(String value) {
    _userName = value;
    notifyListeners();
  }

  void _setRecipeResponse(ApiResponse<List<Recipe>> response) {
    log('Response: $response');
    recipeResponse = response;
    notifyListeners();
  }

  Future<void> getRecipe() async {
    try {
      _setRecipeResponse(ApiResponse.loading());

      CollectionReference recipeCollection = firestore.collection('recipes');
      QuerySnapshot snapshot = await recipeCollection.get();
      List<Recipe> value = snapshot.docs
          .map((doc) => Recipe.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      _setRecipeResponse(ApiResponse.completed(value));
    } catch (error) {
      _setRecipeResponse(ApiResponse.error(error.toString()));
    }
  }

  void getUserName() {
    userName = SharedPreferencesHelper.instance
            .getUserUid(SharedPreferenceKeys.USERNAME) ??
        "Unknown";
  }
}
