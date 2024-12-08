import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gamification/providers/leaderboard_provider.dart';
import 'package:gamification/widgets/bottom_nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final leaderboardProvider = Provider.of<LeaderboardProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.leaderboard),
      ),
      body: FutureBuilder(
        future: leaderboardProvider.fetchLeaderboard(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final leaderboardEntries = leaderboardProvider.entries;

          return ListView.builder(
            itemCount: leaderboardEntries.length,
            itemBuilder: (context, index) {
              final entry = leaderboardEntries[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(entry.profilePicUrl),
                ),
                title: Text(entry.name),
                subtitle: Text(
                    '${AppLocalizations.of(context)?.points}: ${entry.points}'),
                trailing: Text('#${index + 1}'),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}
