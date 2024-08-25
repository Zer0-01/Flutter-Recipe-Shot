import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/features/home/view_model/home_view_model.dart';
import 'package:flutter_recipe_shot/features/recipes/widget/recipes_card_widget.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static const String id = 'home_view';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel vm = HomeViewModel();

  @override
  void initState() {
    super.initState();
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pastelLightGreenColor,
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (context) => vm,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for Foods',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    suffixIcon: const Icon(
                      Icons.filter_alt,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
                Consumer<HomeViewModel>(
                  builder: (context, vm, _) {
                    switch (vm.recipesResponse.status) {
                      case ApiStatus.LOADING:
                        print('Enter loading');
                        return const CircularProgressIndicator();
                      case ApiStatus.ERROR:
                        print('Enter error');

                        return const Placeholder();
                      case ApiStatus.COMPLETED:
                        print('Enter complete');

                        return vm.listRecipe.isEmpty
                            ? const Text('Is empty')
                            : Expanded(
                                child: ListView.builder(
                                  itemCount: vm.listRecipe.length,
                                  itemBuilder: (context, index) {
                                    return RecipesCardWidget(
                                      imageUrl: vm.listRecipe[index].imageUrl,
                                      title: vm.listRecipe[index].title,
                                      description:
                                          vm.listRecipe[index].description,
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.lightGreenColor,
        foregroundColor: AppColors.whiteColor,
        onPressed: () {
          vm.toAddRecipeView(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
