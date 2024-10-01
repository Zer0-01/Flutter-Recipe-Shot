import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/remote/response/api_status.dart';
import 'package:flutter_recipe_shot/features/add_recipe/view/add_recipe_view.dart';
import 'package:flutter_recipe_shot/features/feed/view/feed_view.dart';
import 'package:flutter_recipe_shot/features/main/view_model/main_view_model.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        backgroundColor: AppColors.PURPLE_25,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.person),
          title: Text(AppLocalizations.of(context)!.titleRecipeShot),
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
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
              ),
              selectedIcon: Icon(Icons.home_sharp, color: AppColors.PURPLE_100),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.search_outlined,
              ),
              selectedIcon:
                  Icon(Icons.search_sharp, color: AppColors.PURPLE_100),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.notifications_outlined,
              ),
              selectedIcon:
                  Icon(Icons.notifications_sharp, color: AppColors.PURPLE_100),
              label: 'Notifications',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.email_outlined,
              ),
              selectedIcon:
                  Icon(Icons.email_sharp, color: AppColors.PURPLE_100),
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
          backgroundColor: AppColors.PURPLE_100,
          foregroundColor: AppColors.WHITE,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
