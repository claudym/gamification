import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gamification/providers/user_provider.dart';
import 'package:gamification/widgets/progress_bar.dart';
import 'package:gamification/widgets/bottom_nav_bar.dart';
import 'package:gamification/widgets/badge_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userData = userProvider.userData;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.dashboard),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await userProvider.fetchUserData(userProvider.userId);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              // User Info
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(userData.profilePicUrl),
                ),
                title: Text(userData.name),
                subtitle: Text(
                    '${AppLocalizations.of(context)?.totalPoints} ${userData.points}'),
              ),
              // Progress Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ProgressBar(
                  value: userData.points / userData.nextRewardThreshold,
                  label: AppLocalizations.of(context)!.progressTowardsReward,
                ),
              ),
              // Badges
              if (userData.badges.isNotEmpty)
                BadgeWidget(badges: userData.badges),
              // Completed Trainings
              ExpansionTile(
                title: Text(AppLocalizations.of(context)!.completedTrainings),
                children: userData.completedTrainings.map<Widget>((training) {
                  return ListTile(
                    title: Text(training.name),
                    subtitle: Text(
                        '${AppLocalizations.of(context)?.completedOn} ${training.date}'),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}
