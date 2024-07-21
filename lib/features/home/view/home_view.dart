import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/home/vm/home_vm.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class HomeView extends StatefulWidget {
  static const String id = 'home_view';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeVm vm = HomeVm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Back'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.darkGreenColor),
              child: const Text('User'),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Setting'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              vm.toRecipesView(context);
            },
            child: const Card(
              child: Icon(Icons.restaurant),
            ),
          )
        ],
      ),
    );
  }
}
