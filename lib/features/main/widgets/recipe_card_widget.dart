import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class RecipeCardWidget extends StatelessWidget {
  final String authorName;
  final String recipeCreatedAt;
  final String recipeTitle;
  final String? imageUrl;
  final int likes;
  final int comments;
  final int shares;
  const RecipeCardWidget(
      {super.key,
      required this.authorName,
      required this.recipeCreatedAt,
      required this.recipeTitle,
      this.imageUrl,
      required this.likes,
      required this.comments,
      required this.shares});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with author and date
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const CircleAvatar(radius: 24),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authorName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      recipeCreatedAt,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.BASE_GREY,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              recipeTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          imageUrl != null && imageUrl!.isNotEmpty
              ? Image.network(
                  imageUrl!,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  "https://via.placeholder.com/400x190",
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Icon(Icons.favorite_border),
                    Text(likes.toString()),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.comment_outlined),
                    Text(comments.toString()),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.share_outlined),
                    Text(shares.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
