import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class RecipeDetailsUserWidget extends StatelessWidget {
  final String userId;
  const RecipeDetailsUserWidget({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              userId,
              style: const TextStyle(
                  color: AppColors.PURPLE_100, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
