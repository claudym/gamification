import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamification/models/leaderboard_entry.dart';

class LeaderboardProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<LeaderboardEntry> _entries = [];

  List<LeaderboardEntry> get entries => _entries;

  Future<void> fetchLeaderboard() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('leaderboards')
          .orderBy('points', descending: true)
          .limit(100)
          .get();

      _entries = snapshot.docs
          .map((doc) => LeaderboardEntry.fromDocument(doc))
          .toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching leaderboard: $e');
      // Handle error
    }
  }
}
