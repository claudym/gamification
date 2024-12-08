import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamification/models/training.dart';

class TrainingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Training>> fetchAvailableTrainings() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('trainings').get();

      return snapshot.docs.map((doc) => Training.fromMap(doc.data())).toList();
    } catch (e) {
      print('Error fetching trainings: $e');
      return [];
    }
  }

  Future<void> markTrainingComplete(String userId, Training training) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'completedTrainings': FieldValue.arrayUnion([training.toMap()]),
      });
      // Optionally, update points
    } catch (e) {
      print('Error marking training complete: $e');
    }
  }
}
