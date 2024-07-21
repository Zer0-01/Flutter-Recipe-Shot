import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;

  const CustomTextFormFieldWidget(
      {super.key,
      this.controller,
      this.validator,
      this.hintText,
      this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.secondaryColor,
        labelText: labelText,
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
