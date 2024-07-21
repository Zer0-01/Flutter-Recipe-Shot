import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/features/add_recipe/vm/add_recipe_vm.dart';
import 'package:flutter_recipe_shot/features/add_recipe/widget/add_recipe_elevated_button_widget.dart';
import 'package:flutter_recipe_shot/features/add_recipe/widget/add_recipe_text_form_field_widget.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:provider/provider.dart';

class AddRecipeView extends StatefulWidget {
  static const String id = 'add_recipe_view';
  const AddRecipeView({super.key});

  @override
  State<AddRecipeView> createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {
  AddRecipeVm vm = AddRecipeVm();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => vm,
      child: Consumer<AddRecipeVm>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: AppColors.pastelLightGreenColor,
            appBar: AppBar(
              backgroundColor: AppColors.lightGreenColor,
              foregroundColor: AppColors.whiteColor,
              title: const Text('Add New Recipe', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AddRecipeTextFormFieldWidget(
                    labelText: 'Title',
                    controller: vm.titleController,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  AddRecipeTextFormFieldWidget(
                    labelText: 'Description',
                    controller: vm.descriptionController,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  const AddRecipeTextFormFieldWidget(
                    labelText: 'Ingredients',
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  const AddRecipeTextFormFieldWidget(
                    labelText: 'Steps',
                  ),
                  const Spacer(),
                  AddRecipeElevatedButtonWidget(
                    buttonText: 'Save',
                    onPressed: vm.recipeResponse?.status == ApiStatus.LOADING
                        ? null
                        : () {
                            vm.createRecipe(context);
                          },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
