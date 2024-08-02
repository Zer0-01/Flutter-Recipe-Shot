import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/features/add_recipe/view_model/add_recipe_view_model.dart';
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
  AddRecipeViewModel vm = AddRecipeViewModel();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double screenWidth = size.width;

    return ChangeNotifierProvider(
      create: (context) => vm,
      child: Consumer<AddRecipeViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: AppColors.pastelLightGreenColor,
            appBar: AppBar(
              backgroundColor: AppColors.lightGreenColor,
              foregroundColor: AppColors.whiteColor,
              title: const Text(
                'Add New Recipe',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
                  const SizedBox(
                    height: 32.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      vm.getImage();
                    },
                    child: SizedBox(
                      width: screenWidth,
                      height: 200,
                      child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          color: Colors.blueGrey,
                          strokeWidth: 1,
                          dashPattern: const [5, 5],
                          child: SizedBox.expand(
                            child: FittedBox(
                              child: vm.image != null
                                  ? Image.file(File(vm.image!.path),
                                      fit: BoxFit.cover)
                                  : const Icon(
                                      Icons.image_outlined,
                                      color: Colors.blueGrey,
                                    ),
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
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
