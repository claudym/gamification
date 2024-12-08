import 'package:flutter/material.dart';
import 'package:gamification/services/auth_service.dart';
import 'package:gamification/services/device_security_service.dart';

class AuthenticationProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> signInWithAzureAD() async {
    try {
      final isSecure = await DeviceSecurityService().isDeviceSecure();
      if (!isSecure) {
        // Handle insecure device
        return;
      }
      await _authService.signIn();
      _isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      print('Authentication error: $e');
      _isAuthenticated = false;
      notifyListeners();
    }
  }
}
