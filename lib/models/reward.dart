import 'package:cloud_firestore/cloud_firestore.dart';

class Reward {
  final String id;
  final String category;
  final int pointCost;
  final String description;
  final String imageUrl;
  final bool available;

  Reward({
    required this.id,
    required this.category,
    required this.pointCost,
    required this.description,
    required this.imageUrl,
    required this.available,
  });

  factory Reward.fromDocument(DocumentSnapshot doc) {
    return Reward(
      id: doc.id,
      category: doc['category'],
      pointCost: doc['pointCost'],
      description: doc['description'],
      imageUrl: doc['imageUrl'],
      available: doc['available'],
    );
  }
}
