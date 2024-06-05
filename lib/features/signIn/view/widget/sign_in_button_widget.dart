import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/constants/constants.dart';

class SignInButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  const SignInButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          backgroundColor: WidgetStateProperty.all<Color>(primary),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ))),
      child: const Text('Sign In'),
    );
  }
}
