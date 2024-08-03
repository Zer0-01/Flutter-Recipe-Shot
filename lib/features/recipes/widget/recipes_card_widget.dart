import 'package:flutter/material.dart';

class RecipesCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String description;
  final void Function()? onTap;
  const RecipesCardWidget({
    super.key,
    this.imageUrl,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image at the top
              Container(
                height: 100.0, // Adjust height as needed
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12.0)),
                  image: DecorationImage(
                    image: imageUrl != null
                        ? NetworkImage(imageUrl!)
                        : const NetworkImage(
                            'https://picsum.photos/250?image=1'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Title text
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Description text
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
