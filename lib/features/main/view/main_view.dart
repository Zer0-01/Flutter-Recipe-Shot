import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    vm.getUserName();
    //vm.getRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => vm,
      child: Scaffold(
        backgroundColor: AppColors.BASE_BLACK,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Good Morning, ${vm.userName}!",
                      style: const TextStyle(
                          color: AppColors.BASE_WHITE,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 11.0, top: 16.0, right: 11.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            Column(
                              children: [
                                Text("Anas"),
                                Text("Hello"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Image.network(
                        'https://via.placeholder.com/400x190', // Replace with your image URL
                        height: 190,
                        fit: BoxFit
                            .contain, // Ensures the image fits within the height
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.favorite_border),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text("123")
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.message_outlined),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text("123")
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.share_outlined),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text("123")
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
