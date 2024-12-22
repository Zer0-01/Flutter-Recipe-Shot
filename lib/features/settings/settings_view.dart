import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BASE_BLACK,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.BASE_WHITE,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Settings",
              style: TextStyle(
                color: AppColors.BASE_WHITE,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.BASE_GREY,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: const Icon(
                            size: 15,
                            Icons.logout,
                            color: AppColors.BASE_WHITE,
                            fill: 0.7,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Logout",
                          style: TextStyle(
                            color: AppColors.BASE_WHITE,
                            fontSize: 16,
                          ))
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Divider(),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue),
                          child: const Icon(
                            size: 15,
                            Icons.help,
                            color: AppColors.BASE_WHITE,
                            fill: 0.7,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Help",
                          style: TextStyle(
                            color: AppColors.BASE_WHITE,
                            fontSize: 16,
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
