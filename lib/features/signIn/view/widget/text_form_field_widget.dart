import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController inputController;
  final Widget icon;
  final String labelText;
  final String? Function(String?)? validator;
  const TextFormFieldWidget(
      {super.key,
      required this.inputController,
      required this.icon,
      required this.labelText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: icon,
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      controller: inputController,
      validator: validator,
    );
  }
}
