import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class AddRecipeTextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;

  const AddRecipeTextFormFieldWidget(
      {super.key, required this.labelText, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: controller,
          style: TextStyle(
            color: AppColors.darkGreenColor,
            fontWeight: FontWeight.bold,
          ),
          maxLines: null,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.pastelDarkGreenColor,
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
