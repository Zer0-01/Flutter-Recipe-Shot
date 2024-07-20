import 'package:flutter/material.dart';

class AddRecipeView extends StatefulWidget {
  static const String id = 'add_recipe_view';
  const AddRecipeView({super.key});

  @override
  State<AddRecipeView> createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              
            ),
            TextField(),
            TextField(),
            TextField(),
          ],
        ),
      ),
    );
  }
}
