import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/recipes/view/recipes_view.dart';

class HomeVm extends ChangeNotifier {
  void toRecipesView(BuildContext context) {
    Navigator.pushNamed(context, RecipesView.id);
  }
}
