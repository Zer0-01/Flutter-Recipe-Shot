import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/settings/view_model/settings_view_model.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

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
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ChangeNotifierProvider<SettingsViewModel>(
        create: (context) => vm,
        child: SettingsList(
          sections: [
            SettingsSection(
              title: const Text('General'),
              tiles: [
                SettingsTile(
                  title: const Text('Logout'),
                  leading: const Icon(Icons.logout),
                  onPressed: (context) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Logout'),
                            content:
                                const Text('Are you sure you want to logout?'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  log('Cancel');
                                },
                                child: Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  log('Logout');
                                  vm.logout();
                                },
                                child: Text('Logout'),
                              ),
                            ],
                          );
                        });
                  },
                ),
                SettingsTile(
                  title: const Text('Privacy'),
                  description: const Text('Privacy policy'),
                  leading: const Icon(Icons.privacy_tip),
                  onPressed: (context) {},
                ),
                SettingsTile(
                  title: const Text('About'),
                  description: const Text('About the app'),
                  leading: const Icon(Icons.info),
                  onPressed: (context) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
