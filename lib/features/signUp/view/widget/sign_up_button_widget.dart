import 'package:flutter/material.dart';

class SignUpButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String data;
  final Color? buttonBackgroundColor;
  final Color? buttonForegroundColor;
  const SignUpButtonWidget(
      {super.key,
      this.onPressed,
      required this.data,
      this.buttonBackgroundColor,
      this.buttonForegroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
          foregroundColor: buttonForegroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      child: Text(
        data,
      ),
    );
  }
}
