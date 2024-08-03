class RecipeUpdate {
  final String title;
  final String description;
  final String? imageUrl;

  RecipeUpdate({
    required this.title,
    required this.description,
    this.imageUrl,
  });

  // Factory constructor to create a Recipe from a JSON map
  factory RecipeUpdate.fromJson(Map<String, dynamic> json) {
    return RecipeUpdate(
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  // Method to convert a Recipe instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
