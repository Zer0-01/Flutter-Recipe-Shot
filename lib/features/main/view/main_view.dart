import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/features/add_recipe/view/add_recipe_view.dart';
import 'package:flutter_recipe_shot/features/feed/view/feed_view.dart';
import 'package:flutter_recipe_shot/features/main/view_model/main_view_model.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  static const String id = 'main_view';

  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainViewModel vm = MainViewModel();
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    vm.getRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => vm,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.person),
          title: const Text('Recipe Shot'),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.settings),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          selectedIndex: _currentPageIndex,
          destinations: [
            NavigationDestination(
              icon: const Icon(
                Icons.home_outlined,
              ),
              selectedIcon: Icon(Icons.home_sharp, color: AppColors.lightBlue),
              label: 'Home',
            ),
            NavigationDestination(
              icon: const Icon(
                Icons.search_outlined,
              ),
              selectedIcon:
                  Icon(Icons.search_sharp, color: AppColors.lightBlue),
              label: 'Search',
            ),
            NavigationDestination(
              icon: const Icon(
                Icons.notifications_outlined,
              ),
              selectedIcon:
                  Icon(Icons.notifications_sharp, color: AppColors.lightBlue),
              label: 'Notifications',
            ),
            NavigationDestination(
              icon: const Icon(
                Icons.email_outlined,
              ),
              selectedIcon: Icon(Icons.email_sharp, color: AppColors.lightBlue),
              label: 'Message',
            ),
          ],
        ),
        body: Consumer<MainViewModel>(
          builder: (context, value, child) {
            if (value.recipeResponse.status == ApiStatus.LOADING) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (value.recipeResponse.status == ApiStatus.ERROR) {
              return Center(
                child: Text(value.recipeResponse.message.toString()),
              );
            }
            return <Widget>[
              FeedView(
                recipes: vm.recipeResponse.data ?? [],
              ),
              const Center(
                child: Text('Search'),
              ),
              const Center(
                child: Text('Notifications'),
              ),
              const Center(
                child: Text('Message'),
              ),
            ][_currentPageIndex];
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddRecipeView.id);
          },
          backgroundColor: AppColors.lightBlue,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
