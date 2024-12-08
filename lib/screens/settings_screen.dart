import 'package:flutter/material.dart';
import 'package:gamification/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:gamification/providers/settings_provider.dart'; // Ensure the correct import path
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the SettingsProvider
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text(AppLocalizations.of(context)!.darkMode),
            value: settingsProvider.isDarkMode,
            onChanged: (value) {
              settingsProvider.toggleDarkMode(value);
            },
          ),
          SwitchListTile(
            title: Text(AppLocalizations.of(context)!.notifications),
            value: settingsProvider.notificationsEnabled,
            onChanged: (value) {
              settingsProvider.toggleNotifications(value);
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.signOut),
            onTap: () {
              // Implement sign-out logic
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
    );
  }
}
