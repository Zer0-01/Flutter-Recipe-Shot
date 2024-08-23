class Recipe {
  final String id;
  final String title;
  final String description;
  final String? ingredients;
  final String? instructions;
  final String? imageUrl;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    this.ingredients,
    this.instructions,
    this.imageUrl,
  });

  // Factory constructor to create a Recipe from a JSON map
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
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
      'id': id,
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'instructions': instructions,
      'imageUrl': imageUrl,
    };
  }
}
