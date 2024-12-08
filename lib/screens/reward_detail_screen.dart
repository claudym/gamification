import 'package:flutter/material.dart';
import 'package:gamification/models/reward.dart';

class RewardDetailScreen extends StatelessWidget {
  const RewardDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reward = ModalRoute.of(context)?.settings.arguments as Reward? ??
        Reward(
          id: 'dummy_id',
          title: 'Fallback Dummy Reward',
          description: 'Fallback dummy reward for testing.',
          pointCost: 999,
          imageUrl: 'https://via.placeholder.com/250',
          terms: 'Fallback reward terms and conditions.',
        );

    return Scaffold(
      appBar: AppBar(
        title: Text('Reward Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              reward.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text(reward.title),
              subtitle: Text('${reward.pointCost} points'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                reward.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                reward.terms,
                style:
                    const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Redeem action simulated!')),
                );
              },
              child: const Text('Redeem Reward'),
            ),
          ],
        ),
      ),
    );
  }
}
