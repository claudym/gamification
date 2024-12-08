import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamification/models/reward.dart';

class RewardsProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Reward> _rewards = [];
  bool useDummyData = true;

  List<Reward> get rewards => _rewards;

  Future<void> fetchRewards(String category) async {
    try {
      if (useDummyData) {
        _rewards = _getDummyRewards(category);
      } else {
        QuerySnapshot snapshot = await _firestore
            .collection('rewards')
            .where('category', isEqualTo: category)
            .get();

        _rewards = snapshot.docs
            .map((doc) => Reward.fromDocument(doc))
            .toList()
            .cast<Reward>();
      }

      notifyListeners();
    } catch (e) {
      print('Error fetching rewards: $e');
    }
  }

  List<Reward> _getDummyRewards(String category) {
    final dummyData = [
      Reward(
        id: '1',
        title: 'Coffee Mug',
        description: 'A branded coffee mug.',
        pointCost: 100,
        imageUrl: 'https://via.placeholder.com/150',
        terms: 'Limited to one per user.',
      ),
      Reward(
        id: '2',
        title: 'T-shirt',
        description: 'A branded t-shirt.',
        pointCost: 300,
        imageUrl: 'https://via.placeholder.com/150',
        terms: 'Limited stock available.',
      ),
      Reward(
        id: '3',
        title: 'Headphones',
        description: 'High-quality headphones.',
        pointCost: 500,
        imageUrl: 'https://via.placeholder.com/150',
        terms: 'Cannot be exchanged for other rewards.',
      ),
      Reward(
        id: '4',
        title: 'Backpack',
        description: 'A branded backpack.',
        pointCost: 700,
        imageUrl: 'https://via.placeholder.com/150',
        terms: 'Available while supplies last.',
      ),
    ];

    if (category == 'Small') {
      return dummyData.where((reward) => reward.pointCost <= 300).toList();
    } else if (category == 'Medium') {
      return dummyData
          .where((reward) => reward.pointCost > 300 && reward.pointCost <= 500)
          .toList();
    } else if (category == 'Large') {
      return dummyData.where((reward) => reward.pointCost > 500).toList();
    }

    return dummyData;
  }
}
