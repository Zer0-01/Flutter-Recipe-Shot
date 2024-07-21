import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class HomeCardWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const HomeCardWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 48.0, // Adjust size as needed
              color: AppColors.darkGreenColor, // Adjust color as needed
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
