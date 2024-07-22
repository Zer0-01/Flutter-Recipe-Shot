import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class SigninTextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validator;

  const SigninTextFormFieldWidget(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.icon,
      this.validator,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.whiteColor,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        errorStyle: TextStyle(color: AppColors.whiteColor),
      ),
      validator: validator,
    );
  }
}
