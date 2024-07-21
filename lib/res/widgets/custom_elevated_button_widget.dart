import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomElevatedButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white
        
      ),
      child: const Text('Save'),
    );
  }
}
