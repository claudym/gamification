import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamification/models/user_data.dart';

class UserProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late UserData _userData;
  late String userId;

  UserData get userData => _userData;

  Future<void> fetchUserData(String userId) async {
    try {
      this.userId = userId;
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(userId).get();
      _userData = UserData.fromDocument(doc);
      notifyListeners();
    } catch (e) {
      print('Error fetching user data: $e');
      // Handle error
    }
  }

  void updatePoints(int points) {
    _userData.points += points;
    notifyListeners();
    // Update Firestore if necessary
  }
}
