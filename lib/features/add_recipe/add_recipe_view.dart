import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class AddRecipeView extends StatefulWidget {
  const AddRecipeView({super.key});

  @override
  State<AddRecipeView> createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.BASE_BLACK,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.BASE_WHITE,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Recipe",
                style: TextStyle(
                    color: AppColors.BASE_WHITE,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 38.0),
              const Text(
                "Title",
                style: TextStyle(
                    color: AppColors.BASE_WHITE,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 6.0),
              TextField(
                maxLines: 1,
                cursorColor: Colors.blue,
                style: const TextStyle(
                    color: AppColors.BASE_WHITE,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: AppColors.BASE_GREY,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 22.0),
              const Text(
                "Description",
                style: TextStyle(
                    color: AppColors.BASE_WHITE,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 6.0),
              TextField(
                maxLines: 2,
                cursorColor: Colors.blue,
                style: const TextStyle(
                    color: AppColors.BASE_WHITE,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: AppColors.BASE_GREY,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 22.0),
              const Text(
                "Ingredients",
                style: TextStyle(
                    color: AppColors.BASE_WHITE,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 6.0),
              TextField(
                maxLines: 3,
                cursorColor: Colors.blue,
                style: const TextStyle(
                    color: AppColors.BASE_WHITE,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: AppColors.BASE_GREY,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 22.0),
              const Text(
                "Steps",
                style: TextStyle(
                    color: AppColors.BASE_WHITE,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 6.0),
              TextField(
                maxLines: 5,
                cursorColor: Colors.blue,
                style: const TextStyle(
                    color: AppColors.BASE_WHITE,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: AppColors.BASE_GREY,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 38.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button background color
                  foregroundColor: Colors.black, // Button text color
                  textStyle: const TextStyle(
                    fontSize: 16.0, // Text size
                    fontWeight: FontWeight.w600, // Semi-bold font
                  ),
                  minimumSize: Size(maxWidth, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Border radius
                  ),
                ),
                onPressed: () {
                  // Button action
                },
                child: const Text('Button Text'),
              ),
              const SizedBox(height: 48.0),
            ],
          ),
        ),
      )),
    );
  }
}
