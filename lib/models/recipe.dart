class Recipe {
  final String id;
  final String title;
  final String description;
  final List<String>? ingredients;
  final List<String>? instructions;
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
      ingredients: json['ingredients'] != null
          ? List<String>.from(json['ingredients'])
          : null,
      instructions: json['instructions'] != null
          ? List<String>.from(json['instructions'])
          : null,
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
