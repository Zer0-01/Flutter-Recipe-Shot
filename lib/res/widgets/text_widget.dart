import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String data;
  final Color? textColor;
  final FontWeight? fontWeight;
  const TextWidget({super.key, required this.data, this.textColor, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
