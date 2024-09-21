import 'package:flutter/material.dart';

class AddRecipeListWidget extends StatelessWidget {
  final void Function()? onPressed;
  const AddRecipeListWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField()),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
