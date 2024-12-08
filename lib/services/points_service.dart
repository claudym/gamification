import 'package:cloud_firestore/cloud_firestore.dart';

class PointsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addPoints(String userId, int points) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'points': FieldValue.increment(points),
      });
    } catch (e) {
      print('Error adding points: $e');
    }
  }

  Future<void> assignPointsForTrainingCompletion(
      String userId, int points) async {
    await addPoints(userId, points);
    // Optionally, trigger other actions like notifications
  }
}
