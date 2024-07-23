import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class SignupTextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final String? Function(String?)? validator;
  final void Function()? onPressed;

  const SignupTextFormFieldWidget(
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
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.whiteColor,
        prefixIcon: Icon(leadingIcon),
        suffixIcon: IconButton(
          icon: Icon(trailingIcon),
          onPressed: onPressed,
        ),
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
