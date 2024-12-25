import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class RecipeDetailsView extends StatefulWidget {
  const RecipeDetailsView({super.key});

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.all(17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch ,
          children: [
            Card(
              color: AppColors.BASE_BLACK,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Blue Berry Banana",
                  style: TextStyle(
                      color: AppColors.BASE_WHITE,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 40),
            Text("Ingredient", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)
          ],
        ),
      )),
    );
  }
}
