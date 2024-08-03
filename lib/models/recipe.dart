class Recipe {
  final String id;
  final String title;
  final String description;
  final String? imageUrl;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
  });

  // Factory constructor to create a Recipe from a JSON map
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  // Method to convert a Recipe instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
