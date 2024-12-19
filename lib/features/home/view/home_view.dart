import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/features/add_recipe/add_recipe_view.dart';
import 'package:flutter_recipe_shot/features/home/view_model/home_view_model.dart';
import 'package:flutter_recipe_shot/features/home/widgets/recipe_card_widget.dart';
import 'package:flutter_recipe_shot/models/recipe.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatefulWidget {
  static const String id = 'main_view';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel vm = HomeViewModel();

  @override
  void initState() {
    super.initState();
    vm.getUserName();
    vm.getRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => vm,
      child: Scaffold(
        backgroundColor: AppColors.BASE_BLACK,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Consumer<HomeViewModel>(
              builder: (context, vm, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(radius: 24),
                        const SizedBox(width: 6),
                        Text(
                          AppLocalizations.of(context)!
                              .home_welcome_back(vm.userName),
                          style: const TextStyle(
                            color: AppColors.BASE_WHITE,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: _buildRecipeList(vm),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddRecipeView(),
                ));
          },
          backgroundColor: AppColors.BASE_WHITE,
          foregroundColor: AppColors.BASE_BLACK,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  // Widget to build the recipe list with states
  Widget _buildRecipeList(HomeViewModel vm) {
    if (vm.recipeResponse.status == ApiStatus.LOADING) {
      return const Center(child: CircularProgressIndicator());
    } else if (vm.recipeResponse.status == ApiStatus.COMPLETED) {
      List<Recipe> recipes = vm.recipeResponse.data!;
      return ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return _buildRecipeCard(recipe);
        },
      );
    } else if (vm.recipeResponse.status == ApiStatus.ERROR) {
      return Center(
        child: Text(
          "Error: ${vm.recipeResponse.message}",
          style: const TextStyle(color: Colors.red),
        ),
      );
    } else {
      return const Center(child: Text("No data available."));
    }
  }

  // Widget to build a recipe card
  Widget _buildRecipeCard(Recipe recipe) {
    return RecipeCardWidget(
        authorName: recipe.authorName,
        recipeCreatedAt: recipe.createdAt.toString(),
        recipeTitle: recipe.recipeTitle,
        likes: recipe.likes,
        comments: recipe.comments,
        shares: recipe.shares);
  }
}
