import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/features/add_recipe/view_model/add_recipe_view_model.dart';
import 'package:flutter_recipe_shot/features/add_recipe/widget/add_recipe_elevated_button_widget.dart';
import 'package:flutter_recipe_shot/features/add_recipe/widget/add_recipe_text_form_field_widget.dart';
import 'package:flutter_recipe_shot/features/add_recipe/widget/add_recipe_txtfield_with_button.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddRecipeView extends StatefulWidget {
  static const String id = 'add_recipe_view';
  const AddRecipeView({super.key});

  @override
  State<AddRecipeView> createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {
  AddRecipeViewModel vm = AddRecipeViewModel();
  final _formKey = GlobalKey<FormState>();
  List<String> ingredients = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double screenWidth = size.width;

    return ChangeNotifierProvider(
      create: (context) => vm,
      child: Consumer<AddRecipeViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: AppColors.PURPLE_25,
            appBar: AppBar(
              foregroundColor: AppColors.PURPLE_100,
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddRecipeTextFormFieldWidget(
                        labelText: AppLocalizations.of(context)!.labelTitle,
                        controller: vm.titleController,
                        validator: (value) => value!.isEmpty
                            ? AppLocalizations.of(context)!.errorTitle
                            : null,
                      ),
                      const SizedBox(height: 32.0),
                      AddRecipeTextFormFieldWidget(
                        labelText:
                            AppLocalizations.of(context)!.labelDesciption,
                        controller: vm.descriptionController,
                        validator: (value) => value!.isEmpty
                            ? AppLocalizations.of(context)!.errorDescription
                            : null,
                      ),
                      const SizedBox(height: 32.0),
                      AddRecipeTxtfieldWithButton(
                        labelText:
                            AppLocalizations.of(context)!.labelIngredients,
                        controller: vm.ingredientsController,
                        onPressed: () {
                          vm.addIngredient();
                        },
                      ),
                      if (vm.ingredientsList.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: vm.ingredientsList.length,
                          itemBuilder: (context, index) {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Chip(
                                label: Text(vm.ingredientsList[index]),
                                deleteIcon: const Icon(Icons.clear),
                                onDeleted: () {
                                  vm.removeIngredient(index);
                                },
                              ),
                            );
                          },
                        ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      AddRecipeTxtfieldWithButton(
                        labelText: AppLocalizations.of(context)!.labelSteps,
                        controller: vm.instructionsController,
                        onPressed: () {
                          vm.addInstruction();
                        },
                      ),
                      if (vm.instructionsList.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: vm.instructionsList.length,
                          itemBuilder: (context, index) {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Chip(
                                label: Text(vm.instructionsList[index]),
                                deleteIcon: const Icon(Icons.clear),
                                onDeleted: () {
                                  vm.removeInstruction(index);
                                },
                              ),
                            );
                          },
                        ),
                      const SizedBox(height: 32.0),
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
                      const SizedBox(height: 32.0),
                      AddRecipeElevatedButtonWidget(
                        buttonText: 'Save',
                        onPressed:
                            vm.recipeResponse?.status == ApiStatus.LOADING
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      vm.createRecipe(context);
                                    }
                                  },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
