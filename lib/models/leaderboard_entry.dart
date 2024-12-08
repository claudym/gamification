import 'package:cloud_firestore/cloud_firestore.dart';

class LeaderboardEntry {
  final String name;
  final int points;
  final String profilePicUrl;

  LeaderboardEntry(
      {required this.name, required this.points, required this.profilePicUrl});

  factory LeaderboardEntry.fromDocument(DocumentSnapshot doc) {
    return LeaderboardEntry(
      name: doc['name'],
      points: doc['points'],
      profilePicUrl: doc['profilePicUrl'],
    );
  }
}
