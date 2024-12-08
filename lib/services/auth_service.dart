import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:gamification/utils/constants.dart';

class AuthService {
  final FlutterAppAuth _appAuth = const FlutterAppAuth();

  Future<void> signIn() async {
    try {
      final AuthorizationTokenResponse? result =
          await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          azureClientId,
          azureRedirectUrl,
          discoveryUrl:
              'https://login.microsoftonline.com/$azureTenantId/v2.0/.well-known/openid-configuration',
          scopes: ['openid', 'profile', 'email'],
        ),
      );

      // Use the access token to authenticate with your backend or Firebase
      // For example, sign in with Firebase using a custom token
    } catch (e) {
      print('Error during sign-in: $e');
      // Handle error
    }
  }
}
