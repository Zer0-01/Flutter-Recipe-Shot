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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                  backgroundColor: AppColors.pastelLightGreenColor,
                  appBar: AppBar(
                    backgroundColor: AppColors.pastelLightGreenColor,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          vm.recipe.title,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGreenColor,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              vm.recipe.imageUrl ??
                                  'https://picsum.photos/250?image=1',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          vm.recipe.description,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
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
