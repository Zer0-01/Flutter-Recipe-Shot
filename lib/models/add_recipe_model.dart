class AddRecipeModel {
  String? id; 
  String title;
  String description;
  List<String> ingredients; 
  List<String> instructions; 

  AddRecipeModel({
    this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.instructions,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'ingredients': ingredients.join(', '), 
      'instructions': instructions.join('. '), 
    };
  }

  factory AddRecipeModel.fromMap(Map<String, dynamic> map) {
    return AddRecipeModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      ingredients:
          (map['ingredients'] as String).split(', '), 
      instructions:
          (map['instructions'] as String).split('. '), 
    );
  }
}
