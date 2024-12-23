import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/features/add_recipe/add_recipe_view.dart';
import 'package:flutter_recipe_shot/features/home/view_model/home_view_model.dart';
import 'package:flutter_recipe_shot/features/settings/settings_view.dart';
import 'package:flutter_recipe_shot/models/recipe_model.dart';
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingsView(),
                            ));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
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
                    ),
                    const SizedBox(height: 24),
                    Consumer<HomeViewModel>(
                      builder: (context, vm, child) {
                        switch (vm.recipeResponse.status) {
                          case ApiStatus.LOADING:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          case ApiStatus.ERROR:
                            return Center(
                                child: Text(
                              vm.recipeResponse.message!,
                            ));
                          case ApiStatus.COMPLETED:
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: vm.recipeResponse.data!.length,
                              itemBuilder: (context, index) {
                                RecipeModel recipe =
                                    vm.recipeResponse.data![index];
                                String title = recipe.title;
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 20.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          title,
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        const Icon(Icons.keyboard_arrow_right)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          default:
                            return Container();
                        }
                      },
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
}
