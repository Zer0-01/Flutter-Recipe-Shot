import 'package:flutter_recipe_shot/res/images/image.dart';

class RecipeFeed {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String category;
  final String author;
  final String authorId;
  final String createdAt;

  RecipeFeed({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.author,
    required this.authorId,
    required this.createdAt,
  });

  factory RecipeFeed.fromJson(Map<String, dynamic> json) {
    return RecipeFeed(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'] ?? PLACEHOLDER_IMAGE,
      description: json['description'],
      category: json['category'],
      author: json['author'],
      authorId: json['authorId'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'category': category,
      'author': author,
      'authorId': authorId,
      'createdAt': createdAt,
    };
  }
}
