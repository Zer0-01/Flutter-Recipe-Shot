import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class AddRecipeTextFieldWidget extends StatelessWidget {
  final String label;
  final int maxLines;
  const AddRecipeTextFieldWidget(
      {super.key, required this.label, required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.BASE_WHITE,
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 6.0),
        TextField(
          maxLines: maxLines,
          cursorColor: Colors.blue,
          style: const TextStyle(
            color: AppColors.BASE_WHITE,
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.BASE_GREY,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
