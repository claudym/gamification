import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamification/models/reward.dart';

class RewardsProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Reward> _rewards = [];

  List<Reward> get rewards => _rewards;

  Future<void> fetchRewards(String category) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('rewards')
          .where('category', isEqualTo: category)
          .get();

      _rewards = snapshot.docs.map((doc) => Reward.fromDocument(doc)).toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching rewards: $e');
      // Handle error
    }
  }
}
