import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/features/recipe_details/view_model/recipe_details_view_model.dart';
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
              return const CircularProgressIndicator();
            case ApiStatus.ERROR:
              return const Placeholder();
            case ApiStatus.COMPLETED:
              return Scaffold(
                  appBar: AppBar(
                    title: Text('Recipe Details ${widget.recipeId}'),
                  ),
                  body: Column(
                    children: [
                      Text('Recipe Name: ${vm.recipe.id}'),
                      Text('Recipe Description: ${vm.recipe.description}'),
                    ],
                  ));
            default:
          }
          return Container();
        },
      ),
    );
  }
}
