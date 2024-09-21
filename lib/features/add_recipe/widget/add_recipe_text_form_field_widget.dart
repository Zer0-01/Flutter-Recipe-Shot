import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class AddRecipeTextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color cursorColor;

  const AddRecipeTextFormFieldWidget({
    super.key,
    required this.labelText,
    this.controller,
    this.validator,
    this.cursorColor = AppColors.PURPLE_100,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: AppColors.PURPLE_100,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          cursorColor: cursorColor,
          validator: validator,
          controller: controller,
          style: const TextStyle(
            color: AppColors.PURPLE_100,
            fontWeight: FontWeight.bold,
          ),
          maxLines: null,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.WHITE,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
