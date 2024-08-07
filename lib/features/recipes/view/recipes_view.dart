import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/features/recipes/view_model/recipes_view_model.dart';
import 'package:flutter_recipe_shot/features/recipes/widget/recipes_card_widget.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:provider/provider.dart';

class RecipesView extends StatefulWidget {
  static const String id = 'recipes_view';
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  RecipesViewModel vm = RecipesViewModel();

  @override
  void initState() {
    super.initState();
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pastelLightGreenColor,
      appBar: AppBar(
        backgroundColor: AppColors.pastelLightGreenColor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.lightGreenColor,
        foregroundColor: AppColors.whiteColor,
        onPressed: () {
          vm.toAddRecipeView(context);
        },
        child: const Icon(Icons.add),
      ),
      body: ChangeNotifierProvider<RecipesViewModel>(
        create: (context) => vm,
        child: Consumer<RecipesViewModel>(
          builder: (context, vm, _) {
            switch (vm.recipesResponse.status) {
              case ApiStatus.LOADING:
                return const CircularProgressIndicator();
              case ApiStatus.ERROR:
                return const Placeholder();
              case ApiStatus.COMPLETED:
                return vm.listRecipe.isEmpty
                    ? const Text('Is empty')
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.builder(
                          itemCount: vm.listRecipe.length,
                          itemBuilder: (context, index) {
                            return RecipesCardWidget(
                              imageUrl: vm.listRecipe[index].imageUrl,
                              title: vm.listRecipe[index].title,
                              description: vm.listRecipe[index].description,
                              onTap: () {
                                vm.toRecipeDetailsView(
                                    context, vm.listRecipe[index]);
                              },
                            );
                          },
                        ),
                      );
              default:
            }

            return Container();
          },
        ),
      ),
    );
  }
}
