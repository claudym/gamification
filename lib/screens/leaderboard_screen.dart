import 'package:flutter/material.dart';
import 'package:gamification/widgets/bottom_nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final leaderboardEntries = [
      {
        'profilePicUrl': 'https://via.placeholder.com/150',
        'name': 'Alice',
        'points': 1200,
      },
      {
        'profilePicUrl': 'https://via.placeholder.com/150',
        'name': 'Bob',
        'points': 1100,
      },
      {
        'profilePicUrl': 'https://via.placeholder.com/150',
        'name': 'Charlie',
        'points': 1000,
      },
      {
        'profilePicUrl': 'https://via.placeholder.com/150',
        'name': 'Diana',
        'points': 950,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.leaderboard),
      ),
      body: ListView.builder(
        itemCount: leaderboardEntries.length,
        itemBuilder: (context, index) {
          final entry = leaderboardEntries[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(entry['profilePicUrl'] as String? ?? ''),
            ),
            title: Text(entry['name'] as String? ?? 'Unknown'),
            subtitle: Text(
                '${AppLocalizations.of(context)?.points}: ${entry['points'] ?? 0}'),
            trailing: Text('#${index + 1}'),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}
