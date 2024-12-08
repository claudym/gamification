import 'package:flutter/material.dart';
import 'package:gamification/models/reward.dart';

class RewardCard extends StatelessWidget {
  final Reward reward;

  const RewardCard({super.key, required this.reward});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/rewardDetail',
          arguments: reward,
        );
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            Expanded(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder.png',
                image: reward.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            ListTile(
              title: Text(reward.description),
              subtitle: Text('${reward.pointCost} points'),
            ),
          ],
        ),
      ),
    );
  }
}
