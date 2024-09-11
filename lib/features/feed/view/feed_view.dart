import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/feed/widgets/card_feed_widget.dart';
import 'package:flutter_recipe_shot/models/recipe.dart';

class FeedView extends StatelessWidget {
  final List<Recipe> recipes;
  FeedView({super.key, required this.recipes});

  final List<Tweet> tweets = [
    Tweet(
      username: 'John Doe',
      handle: '@johndoe',
      content: 'This is my first tweet!',
      profileImageUrl: 'https://via.placeholder.com/150',
      timeAgo: '2h',
      imageUrl: 'https://via.placeholder.com/500',
    ),
    Tweet(
      username: 'Jane Smith',
      handle: '@janesmith',
      content: 'Loving Flutter for mobile development! ❤️',
      profileImageUrl: 'https://via.placeholder.com/150',
      timeAgo: '1h',
      imageUrl: '',
    ),
    Tweet(
      username: 'Tech Guru',
      handle: '@techguru',
      content: 'Check out my latest blog on mobile app development! 📱',
      profileImageUrl: 'https://via.placeholder.com/150',
      timeAgo: '30m',
      imageUrl: 'https://via.placeholder.com/500',
    ),
  ];

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

class Tweet {
  final String username;
  final String handle;
  final String content;
  final String profileImageUrl;
  final String timeAgo;
  final String imageUrl;

  Tweet({
    required this.username,
    required this.handle,
    required this.content,
    required this.profileImageUrl,
    required this.timeAgo,
    required this.imageUrl,
  });
}
