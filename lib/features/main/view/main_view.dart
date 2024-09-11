import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class MainView extends StatefulWidget {
  static const String id = 'main_view';

  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            selectedIcon: Icon(Icons.search_sharp, color: AppColors.lightBlue),
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
      body: <Widget>[
        const Center(
          child: Text('Home'),
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
      ][_currentPageIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.lightBlue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
