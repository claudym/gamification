import 'package:cloud_firestore/cloud_firestore.dart';
import 'training.dart';

class UserData {
  final String name;
  final String email;
  late final int points;
  final List<Training> completedTrainings;
  final List<String> rewardsRedeemed;
  final String profilePicUrl;
  final int nextRewardThreshold;
  final List<String> badges;

  UserData({
    required this.name,
    required this.email,
    required this.points,
    required this.completedTrainings,
    required this.rewardsRedeemed,
    required this.profilePicUrl,
    required this.nextRewardThreshold,
    required this.badges,
  });

  factory UserData.fromDocument(DocumentSnapshot doc) {
    return UserData(
      name: doc['name'],
      email: doc['email'],
      points: doc['points'],
      completedTrainings: (doc['completedTrainings'] as List)
          .map((e) => Training.fromMap(e))
          .toList(),
      rewardsRedeemed: List<String>.from(doc['rewardsRedeemed'] ?? []),
      profilePicUrl: doc['profilePicUrl'],
      nextRewardThreshold: doc['nextRewardThreshold'] ?? 1000,
      badges: List<String>.from(doc['badges'] ?? []),
    );
  }
}
