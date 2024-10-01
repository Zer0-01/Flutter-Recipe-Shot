class RecipeUpdate {
  final String title;
  final String description;
  final List<String>? ingredients;
  final List<String>? instructions;
  final String? imageUrl;
  final String userUid;

  RecipeUpdate({
    required this.title,
    required this.description,
    this.ingredients,
    this.instructions,
    this.imageUrl,
    required this.userUid,
  });

  // Factory constructor to create a RecipeUpdate from a JSON map
  factory RecipeUpdate.fromJson(Map<String, dynamic> json) {
    return RecipeUpdate(
      title: json['title'],
      description: json['description'],
      ingredients: json['ingredients'] != null
          ? List<String>.from(json['ingredients'])
          : null,
      instructions: json['instructions'] != null
          ? List<String>.from(json['instructions'])
          : null,
      imageUrl: json['imageUrl'],
      userUid: json['userUid'],
    );
  }

  // Method to convert a RecipeUpdate instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'instructions': instructions,
      'imageUrl': imageUrl,
      'userUid': userUid,
    };
  }
}
