import 'package:flutter/material.dart';

class RecipeDetailsView extends StatefulWidget {
  static const String id = 'recipe_details_view';
  final String recipeId;

  const RecipeDetailsView({super.key, required this.recipeId});

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Recipe Details ${widget.recipeId}'),
    ));
  }
}
