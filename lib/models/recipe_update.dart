class RecipeUpdate {
  final String title;
  final String description;
  final String? ingredients;
  final String? instructions;
  final String? imageUrl;

  RecipeUpdate({
    required this.title,
    required this.description,
    this.ingredients,
    this.instructions,
    this.imageUrl,
  });

  // Factory constructor to create a Recipe from a JSON map
  factory RecipeUpdate.fromJson(Map<String, dynamic> json) {
    return RecipeUpdate(
      title: json['title'],
      description: json['description'],
      ingredients: json['ingredients'],
      instructions: json['instructions'],
      imageUrl: json['imageUrl'],
    );
  }

  // Method to convert a Recipe instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'instructions': instructions,
      'imageUrl': imageUrl,
    };
  }
}
