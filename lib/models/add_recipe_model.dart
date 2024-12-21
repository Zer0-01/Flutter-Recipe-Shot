class AddRecipeModel {
  String? id; // Optional, useful for databases that use unique IDs
  String title;
  String description;
  List<String> ingredients; // Storing ingredients as a list
  List<String> instructions; // Storing instructions as a list

  AddRecipeModel({
    this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.instructions,
  });

  // Convert a Recipe object to a map (for database insertion)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'ingredients': ingredients.join(', '), // Save as a string if needed
      'instructions': instructions.join('. '), // Save as a string if needed
    };
  }

  // Create a Recipe object from a map (e.g., from the database)
  factory AddRecipeModel.fromMap(Map<String, dynamic> map) {
    return AddRecipeModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      ingredients:
          (map['ingredients'] as String).split(', '), // Parse string to list
      instructions:
          (map['instructions'] as String).split('. '), // Parse string to list
    );
  }
}
