import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
   final TextEditingController inputController;
  final String labelText;
  final String? Function(String?)? validator;
  const TextFormFieldWidget(
      {super.key,
      required this.inputController,
      required this.labelText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      controller: inputController,
      validator: validator,
    );
  }
}