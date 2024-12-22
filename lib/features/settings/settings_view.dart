import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            Text(
              AppLocalizations.of(context)!.settings_settings,
              style: const TextStyle(
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
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: AppColors.BASE_WHITE,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Text(
                              AppLocalizations.of(context)!.settings_logout,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            content: Text(AppLocalizations.of(context)!
                                .settings_logout_confirmation),
                            actions: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: AppColors.BASE_BLACK,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(AppLocalizations.of(context)!
                                    .general_cancel),
                              ),
                              FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: AppColors.BASE_BLACK,
                                  foregroundColor: AppColors.BASE_WHITE,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Text(AppLocalizations.of(context)!
                                    .settings_logout),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Row(
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
