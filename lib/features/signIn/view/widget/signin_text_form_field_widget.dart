import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class SigninTextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final String? Function(String?)? validator;
  final void Function()? onPressed;

  const SigninTextFormFieldWidget(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.leadingIcon,
      this.validator,
      required this.hintText,
      this.trailingIcon,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.WHITE,
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(
        color: AppColors.WHITE,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: const TextStyle(
          color: AppColors.WHITE,
        ),
        errorStyle: const TextStyle(
          color: Colors.red
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.WHITE),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.WHITE),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        suffixIcon: IconButton(
          color: AppColors.WHITE,
          icon: Icon(trailingIcon),
          onPressed: onPressed,
        ),
      ),
      validator: validator,
    );
  }
}
