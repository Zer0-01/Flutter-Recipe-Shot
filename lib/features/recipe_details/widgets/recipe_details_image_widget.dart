import 'package:flutter/material.dart';

class RecipeDetailsImageWidget extends StatelessWidget {
  final String? imageUrl;
  const RecipeDetailsImageWidget({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          imageUrl ??
              'https://www.its.ac.id/tmesin/wp-content/uploads/sites/22/2022/07/no-image.png',
        ),
      ),
    );
  }
}
