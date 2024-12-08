import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gamification/providers/authentication_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/lion-logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  // await authProvider.signInWithAzureAD();
                  Navigator.pushReplacementNamed(context, '/dashboard');
                  // TODO: Implement sign in with Azure
                  // if (authProvider.isAuthenticated) {
                  //   Navigator.pushReplacementNamed(context, '/dashboard');
                  // } else {
                  //   // Handle authentication failure
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content:
                  //           Text(AppLocalizations.of(context)!.signInFailed),
                  //     ),
                  //   );
                  // }
                },
                child: Text(AppLocalizations.of(context)!.signIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
