import 'package:flutter/material.dart';

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
        child: const Text(
          'Not Sign Up Yet, Click Here',
          style: TextStyle(color: Colors.blue),
        ));
  }
}
