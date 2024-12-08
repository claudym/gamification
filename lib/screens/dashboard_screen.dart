import 'package:flutter/material.dart';
import 'package:gamification/widgets/progress_bar.dart';
import 'package:gamification/widgets/bottom_nav_bar.dart';
import 'package:gamification/widgets/badge_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = {
      'profilePicUrl':
          'https://scontent.fsdq1-1.fna.fbcdn.net/v/t39.30808-1/420068859_355377473973974_5508134405417493754_n.jpg?stp=dst-jpg_s480x480_tt6&_nc_cat=101&ccb=1-7&_nc_sid=0ecb9b&_nc_eui2=AeFgCLVevj6GregPvh7ui7zX3XUplLaZhfnddSmUtpmF-RVd3D3A4_R5_K6euxN56vvsolvQOoIUIm0k3yytImQ1&_nc_ohc=Op3MW8Bj3pUQ7kNvgEKJWc1&_nc_zt=24&_nc_ht=scontent.fsdq1-1.fna&_nc_gid=ANnQ30CmLkO3AJsZT8vstL7&oh=00_AYBQYNyNWAy4F3lOWZVSlK3Tj8xvxtBrv2OVooMGYcDDgQ&oe=675BC5BA',
      'name': 'Nelson Lora',
      'points': 750,
      'nextRewardThreshold': 1000,
      'badges': ['Badge 1', 'Badge 2'],
      'completedTrainings': [
        {'name': 'Training A', 'date': '2024-12-01'},
        {'name': 'Training B', 'date': '2024-12-03'},
      ],
    };

    final points = userData['points'] as int? ?? 0;
    final nextRewardThreshold = userData['nextRewardThreshold'] as int? ?? 1;
    final badges = userData['badges'] as List<String>? ?? [];
    final completedTrainings =
        userData['completedTrainings'] as List<Map<String, dynamic>>? ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.dashboard),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              // User Info
              ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(userData['profilePicUrl'] as String? ?? ''),
                ),
                title: Text(userData['name'] as String? ?? 'No Name'),
                subtitle: Text(
                    '${AppLocalizations.of(context)?.totalPoints} $points'),
              ),
              // Progress Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ProgressBar(
                  value: nextRewardThreshold > 0
                      ? points / nextRewardThreshold
                      : 0,
                  label: AppLocalizations.of(context)!.progressTowardsReward,
                ),
              ),
              // Badges
              if (badges.isNotEmpty) BadgeWidget(badges: badges),
              // Completed Trainings
              ExpansionTile(
                title: Text(AppLocalizations.of(context)!.completedTrainings),
                children: completedTrainings.map<Widget>((training) {
                  return ListTile(
                    title: Text(training['name'] ?? 'No Name'),
                    subtitle: Text(
                        '${AppLocalizations.of(context)?.completedOn} ${training['date'] ?? 'Unknown Date'}'),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
