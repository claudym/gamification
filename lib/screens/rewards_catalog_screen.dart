import 'package:flutter/material.dart';
import 'package:gamification/models/reward.dart';
import 'package:gamification/widgets/reward_card.dart';
import 'package:gamification/widgets/bottom_nav_bar.dart';

class RewardsCatalogScreen extends StatefulWidget {
  const RewardsCatalogScreen({super.key});

  @override
  _RewardsCatalogScreenState createState() => _RewardsCatalogScreenState();
}

class _RewardsCatalogScreenState extends State<RewardsCatalogScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<String> categories;
  late List<Reward> rewards;
  late List<Reward> filteredRewards;

  @override
  void initState() {
    super.initState();
    categories = ['Small', 'Medium', 'Large'];
    rewards = [
      Reward(
        id: '1',
        title: 'Coffee Mug',
        description: 'A branded coffee mug to enjoy your favorite drinks.',
        pointCost: 100,
        imageUrl: 'https://via.placeholder.com/150',
        terms: 'This reward is non-refundable. Limited to one per user.',
      ),
      Reward(
        id: '2',
        title: 'T-shirt',
        description: 'A branded t-shirt for your casual outings.',
        pointCost: 300,
        imageUrl: 'https://via.placeholder.com/150',
        terms: 'This reward is non-refundable. Limited stock available.',
      ),
      Reward(
        id: '3',
        title: 'Headphones',
        description: 'High-quality headphones for your music needs.',
        pointCost: 500,
        imageUrl: 'https://via.placeholder.com/150',
        terms: 'One-time redemption. Cannot be exchanged for other rewards.',
      ),
      Reward(
        id: '4',
        title: 'Backpack',
        description: 'A stylish and durable branded backpack.',
        pointCost: 700,
        imageUrl: 'https://via.placeholder.com/150',
        terms: 'Limited to one per user. Available while supplies last.',
      ),
    ];
    filteredRewards = _filterRewardsByCategory(0);

    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards Catalog'),
        bottom: TabBar(
          controller: _tabController,
          tabs: categories.map((category) => Tab(text: category)).toList(),
          onTap: (index) {
            setState(() {
              filteredRewards = _filterRewardsByCategory(index);
            });
          },
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: filteredRewards.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final reward = filteredRewards[index];
          return RewardCard(reward: reward);
        },
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }

  List<Reward> _filterRewardsByCategory(int categoryIndex) {
    int threshold = (categoryIndex + 1) * 400;
    return rewards.where((reward) => reward.pointCost < threshold).toList();
  }
}
