import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class SignUpNavigatorWidget extends StatelessWidget {
  final void Function()? onPressed;
  const SignUpNavigatorWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.blue,
        ),
        onPressed: onPressed,
        child: Text(
          'Not Sign Up Yet, Click Here',
          style: TextStyle(color: AppColors.whiteColor),
        ));
  }
}
