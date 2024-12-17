class Recipe {
  final String recipeId;
  final String authorId;
  final String authorName;
  final String recipeTitle;
  final String? imageUrl;
  final DateTime createdAt;
  final int likes;
  final int comments;
  final int shares;

  Recipe({
    required this.recipeId,
    required this.authorId,
    required this.authorName,
    required this.recipeTitle,
    this.imageUrl,
    required this.createdAt,
    required this.likes,
    required this.comments,
    required this.shares,
  });

  // Factory constructor to create a Recipe from a JSON map
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      recipeId: json['recipeId'],
      authorId: json['authorId'],
      authorName: json['authorName'],
      recipeTitle: json['recipeTitle'],
      imageUrl: json['imageUrl'],
      createdAt: json['createdAt'].toDate(),
      likes: json['likes'],
      comments: json['comments'],
      shares: json['shares'],
    );
  }

  // Method to convert a Recipe instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'recipeId': recipeId,
      'authorId': authorId,
      'authorName': authorName,
      'recipeTitle': recipeTitle,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'likes': likes,
      'comments': comments,
      'shares': shares,
    };
  }
}
