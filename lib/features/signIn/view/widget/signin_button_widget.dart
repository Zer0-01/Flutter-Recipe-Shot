import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class SignInButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  const SignInButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.lightGreenColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
        ),
        child: const Text('Sign In'),
      ),
    );
  }
}
