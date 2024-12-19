import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddRecipeViewModel extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();

  TextEditingController get titleController => _titleController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get ingredientsController => _ingredientsController;
  TextEditingController get instructionsController => _instructionsController;

  set titleController(TextEditingController value) {
    _titleController.text = value.text;
    notifyListeners();
  }

  set descriptionController(TextEditingController value) {
    _descriptionController.text = value.text;
    notifyListeners();
  }

  set ingredientsController(TextEditingController value) {
    _ingredientsController.text = value.text;
    notifyListeners();
  }

  set instructionsController(TextEditingController value) {
    _instructionsController.text = value.text;
    notifyListeners();
  }
}
