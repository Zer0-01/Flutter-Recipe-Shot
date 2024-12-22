import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/settings/settings_view_model.dart';
import 'package:flutter_recipe_shot/features/signIn/view/signin_view.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  SettingsViewModel vm = SettingsViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BASE_BLACK,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.BASE_WHITE,
      ),
      body: ChangeNotifierProvider(
        create: (context) => vm,
        child: Consumer<SettingsViewModel>(
          builder: (context, vm, child) {
            return SafeArea(
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
                                    AppLocalizations.of(context)!
                                        .settings_logout,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content: Text(AppLocalizations.of(context)!
                                      .settings_logout_confirmation),
                                  actions: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppColors.BASE_BLACK,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) {
                                            Future.delayed(
                                                const Duration(seconds: 3),
                                                () async {
                                              try {
                                                await vm.logout();
                                                Navigator.pop(context);
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SigninView(),
                                                    ));

                                                Fluttertoast.showToast(
                                                  msg: AppLocalizations.of(
                                                          context)!
                                                      .settings_toast_logout_success,
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor:
                                                      AppColors.BASE_GREY,
                                                  textColor:
                                                      AppColors.BASE_WHITE,
                                                  fontSize: 16.0,
                                                );
                                              } catch (e) {
                                                Navigator.pop(context);
                                                Fluttertoast.showToast(
                                                  msg: AppLocalizations.of(
                                                          context)!
                                                      .settings_toast_logout_error,
                                                  toastLength:
                                                      Toast.LENGTH_LONG,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor:
                                                      AppColors.BASE_WHITE,
                                                  fontSize: 16.0,
                                                );
                                              }
                                            });

                                            return Dialog(
                                              backgroundColor:
                                                  Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: AppColors.BASE_WHITE,
                                                    strokeWidth: 3,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
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
                                      shape: BoxShape.circle,
                                      color: Colors.red),
                                  child: const Icon(
                                    size: 15,
                                    Icons.logout,
                                    color: AppColors.BASE_WHITE,
                                    fill: 0.7,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                  AppLocalizations.of(context)!.settings_logout,
                                  style: const TextStyle(
                                    color: AppColors.BASE_WHITE,
                                    fontSize: 16,
                                  ))
                            ],
                          ),
                        ),
                        const Divider(),
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
                            Text(AppLocalizations.of(context)!.settings_help,
                                style: const TextStyle(
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
            ));
          },
        ),
      ),
    );
  }
}
