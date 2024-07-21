import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class AddRecipeElevatedButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  const AddRecipeElevatedButtonWidget({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightGreenColor, // Background color
          foregroundColor: AppColors.whiteColor, // Foreground (text) color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Padding
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontWeight: FontWeight.bold, // Bold text
          ),
        ),
      ),
    );
  }
}
