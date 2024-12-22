import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/features/add_recipe/add_recipe_view_model.dart';
import 'package:flutter_recipe_shot/features/add_recipe/widgets/add_recipe_text_field_widget.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:provider/provider.dart';

class AddRecipeView extends StatefulWidget {
  const AddRecipeView({super.key});

  @override
  State<AddRecipeView> createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {
  AddRecipeViewModel vm = AddRecipeViewModel();
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.BASE_BLACK,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.BASE_WHITE,
      ),
      body: ChangeNotifierProvider(
        create: (context) => vm,
        child: Consumer<AddRecipeViewModel>(
          builder: (context, vm, child) {
            return SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Add Recipe",
                      style: TextStyle(
                          color: AppColors.BASE_WHITE,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 38.0),
                    AddRecipeTextFieldWidget(
                        label: "Title",
                        maxLines: 1,
                        controller: vm.titleController),
                    const SizedBox(height: 22.0),
                    AddRecipeTextFieldWidget(
                        label: "Description",
                        maxLines: 2,
                        controller: vm.descriptionController),
                    const SizedBox(height: 22.0),
                    AddRecipeTextFieldWidget(
                        label: "Ingredients",
                        maxLines: 3,
                        controller: vm.ingredientsController),
                    const SizedBox(height: 22.0),
                    AddRecipeTextFieldWidget(
                        label: "Instructions",
                        maxLines: 5,
                        controller: vm.instructionsController),
                    const SizedBox(height: 38.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        disabledBackgroundColor: AppColors.BASE_GREY,
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                        minimumSize: Size(maxWidth, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed:
                          vm.addRecipeResponse?.status == ApiStatus.LOADING
                              ? null
                              : () {
                                  vm.addRecipe();
                                },
                      child: vm.addRecipeResponse?.status == ApiStatus.LOADING
                          ? const CircularProgressIndicator(color: AppColors.BASE_BLACK,)
                          : const Text('Submit'),
                    ),
                    const SizedBox(height: 48.0),
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
