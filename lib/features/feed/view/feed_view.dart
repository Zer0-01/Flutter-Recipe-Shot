import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/feed/widgets/card_feed_widget.dart';
import 'package:flutter_recipe_shot/models/recipe.dart';

class FeedView extends StatelessWidget {
  final List<Recipe> recipes;
  const FeedView({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        var recipe = recipes[index];
        return CardFeedWidget(
          username: recipe.id,
          description: recipe.title,
          imageUrl: recipe.imageUrl ?? '',
        );
      },
    );
  }
}