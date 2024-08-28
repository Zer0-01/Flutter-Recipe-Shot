import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('General'),
            tiles: [
              SettingsTile(
                title: const Text('Logout'),
                leading: const Icon(Icons.logout),
                onPressed: (context) {},
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
    );
  }
}
