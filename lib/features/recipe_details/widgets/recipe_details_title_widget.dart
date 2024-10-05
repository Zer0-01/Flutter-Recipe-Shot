import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class RecipeDetailsTitleWidget extends StatelessWidget {
  final String recipeTitle;
  const RecipeDetailsTitleWidget({super.key, required this.recipeTitle});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Text(
          recipeTitle,
          style: const TextStyle(
              color: AppColors.PURPLE_100,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
