import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/home/view_model/home_view_model.dart';
import 'package:flutter_recipe_shot/features/home/widget/home_widget.dart';
import 'package:flutter_recipe_shot/features/home/widget/profile_widget.dart';
import 'package:flutter_recipe_shot/features/home/widget/settings_widget.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class HomeView extends StatefulWidget {
  static const String id = 'home_view';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeWidget(),
    const ProfileWidget(),
    const SettingsWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
