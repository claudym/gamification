import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gamification/models/reward.dart';
import 'package:gamification/providers/user_provider.dart';
import 'package:gamification/services/redeem_reward_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RewardDetailScreen extends StatelessWidget {
  const RewardDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Extract the Reward object from the arguments
    final reward = ModalRoute.of(context)?.settings.arguments as Reward?;
    if (reward == null) {
      // Handle the null case by showing an error message
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)?.error ?? 'Error'),
        ),
        body: Center(
          child: Text(AppLocalizations.of(context)?.noRewardData ??
              'No reward data found.'),
        ),
      );
    }

    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)?.rewardDetails ?? 'Reward Details'),
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
              title: Text(reward.description),
              subtitle: Text(
                '${reward.pointCost} ${AppLocalizations.of(context)?.points ?? 'points'}',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                AppLocalizations.of(context)?.rewardTerms ??
                    'Reward terms and conditions.',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: (userProvider.userData?.points ?? 0) >=
                      reward.pointCost
                  ? () async {
                      final success = await RedeemRewardService().redeemReward(
                        reward.id,
                        userProvider.userId,
                      );
                      if (success) {
                        // Update user data
                        await userProvider.fetchUserData(userProvider.userId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              AppLocalizations.of(context)?.rewardRedeemed ??
                                  'Reward redeemed successfully.',
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              AppLocalizations.of(context)?.redeemFailed ??
                                  'Failed to redeem reward.',
                            ),
                          ),
                        );
                      }
                    }
                  : null,
              child: Text(AppLocalizations.of(context)?.redeemReward ??
                  'Redeem Reward'),
            ),
          ],
        ),
      ),
    );
  }
}
