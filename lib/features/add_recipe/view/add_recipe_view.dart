import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/widgets/custom_elevated_button_widget.dart';
import 'package:flutter_recipe_shot/res/widgets/custom_text_form_field_widget.dart';

class AddRecipeView extends StatefulWidget {
  static const String id = 'add_recipe_view';
  const AddRecipeView({super.key});

  @override
  State<AddRecipeView> createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const CustomTextFormFieldWidget(
              labelText: 'Title',
            ),
            const SizedBox(
              height: 8,
            ),
            const CustomTextFormFieldWidget(
              labelText: 'Description',
            ),
            const SizedBox(
              height: 8,
            ),
            CustomElevatedButtonWidget(
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
