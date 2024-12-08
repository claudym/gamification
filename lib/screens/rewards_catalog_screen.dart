import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gamification/providers/rewards_provider.dart';
import 'package:gamification/widgets/reward_card.dart';
import 'package:gamification/widgets/bottom_nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RewardsCatalogScreen extends StatefulWidget {
  const RewardsCatalogScreen({super.key});

  @override
  _RewardsCatalogScreenState createState() => _RewardsCatalogScreenState();
}

class _RewardsCatalogScreenState extends State<RewardsCatalogScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<String> categories;

  @override
  void initState() {
    super.initState();
    // Initialize categories with localized values
    categories = [
      AppLocalizations.of(context)!.small,
      AppLocalizations.of(context)!.medium,
      AppLocalizations.of(context)!.large,
    ];
    _tabController = TabController(length: categories.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchRewards(categories[0]);
    });
  }

  void _fetchRewards(String category) {
    Provider.of<RewardsProvider>(context, listen: false).fetchRewards(category);
  }

  @override
  Widget build(BuildContext context) {
    final rewardsProvider = Provider.of<RewardsProvider>(context);
    final rewards = rewardsProvider.rewards;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.rewardsCatalog),
        bottom: TabBar(
          controller: _tabController,
          tabs: categories.map((category) => Tab(text: category)).toList(),
          onTap: (index) {
            _fetchRewards(categories[index]);
          },
        ),
      ),
      body: rewards == null
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: rewards.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust according to screen size
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final reward = rewards[index];
                return RewardCard(reward: reward);
              },
            ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}
