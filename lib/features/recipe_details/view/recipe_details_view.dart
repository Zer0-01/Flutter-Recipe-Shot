import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/features/recipe_details/view_model/recipe_details_view_model.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:provider/provider.dart';

class RecipeDetailsView extends StatefulWidget {
  static const String id = 'recipe_details_view';
  final String recipeId;

  const RecipeDetailsView({super.key, required this.recipeId});

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  RecipeDetailsViewModel vm = RecipeDetailsViewModel();
  @override
  void initState() {
    super.initState();
    vm.init(widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecipeDetailsViewModel>(
      create: (context) => vm,
      child: Consumer<RecipeDetailsViewModel>(
        builder: (context, vm, _) {
          switch (vm.recipeResponse.status) {
            case ApiStatus.LOADING:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case ApiStatus.ERROR:
              return const Placeholder();
            case ApiStatus.COMPLETED:
              return Scaffold(
                  backgroundColor: AppColors.PURPLE_25,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.red,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                vm.recipe.id,
                                style: const TextStyle(
                                    color: AppColors.PURPLE_100,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            vm.recipe.title,
                            style: const TextStyle(
                                color: AppColors.PURPLE_100, fontSize: 20),
                          ),
                        ),
                        Text(vm.recipe.description),
                        const Text("Ingredients:"),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: vm.recipe.ingredients?.length,
                          itemBuilder: (context, index) {
                            return Text("${index + 1}.\t\t${vm.recipe.ingredients![index]}");
                          },
                        ),
                        const Text("Instructions:"),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: vm.recipe.instructions?.length,
                          itemBuilder: (context, index) {
                            return Text("${index + 1}.\t\t${vm.recipe.instructions![index]}");
                          },
                        ),
                      ],
                    ),
                  ));
            default:
          }
          return Container();
        },
      ),
    );
  }
}
