import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/models/recipe_model.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class RecipeDetailsView extends StatefulWidget {
  final RecipeModel recipeModel;
  const RecipeDetailsView({super.key, required this.recipeModel});

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: AppColors.BASE_BLACK,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  widget.recipeModel.title,
                  style: const TextStyle(
                      color: AppColors.BASE_WHITE,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const TabBar(
                      indicator: BoxDecoration(),
                      dividerColor: Colors.transparent,
                      isScrollable: true,
                      indicatorColor: AppColors.BASE_BLACK,
                      labelStyle: TextStyle(
                          color: AppColors.BASE_BLACK,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      unselectedLabelStyle: TextStyle(
                          color: AppColors.BASE_BLACK,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                      tabs: [
                        Tab(
                          text: "Description",
                        ),
                        Tab(
                          text: "Ingredients",
                        ),
                        Tab(
                          text: "Instructions",
                        ),
                      ],
                    ),
                    const SizedBox(height: 47),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Text(
                            widget.recipeModel.description,
                            style: const TextStyle(
                              color: AppColors.BASE_BLACK,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            widget.recipeModel.ingredients,
                            style: const TextStyle(
                              color: AppColors.BASE_BLACK,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            widget.recipeModel.instructions,
                            style: const TextStyle(
                              color: AppColors.BASE_BLACK,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
