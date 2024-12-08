import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  // Private variables to hold the settings state
  bool _isDarkMode = false;
  bool _notificationsEnabled = true;

  // Getter for dark mode status
  bool get isDarkMode => _isDarkMode;

  // Getter for notification status
  bool get notificationsEnabled => _notificationsEnabled;

  // Method to toggle dark mode
  void toggleDarkMode(bool isEnabled) {
    _isDarkMode = isEnabled;
    notifyListeners(); // Notify listeners to rebuild UI
  }

  // Method to toggle notifications
  void toggleNotifications(bool isEnabled) {
    _notificationsEnabled = isEnabled;
    notifyListeners(); // Notify listeners to rebuild UI
  }
}
