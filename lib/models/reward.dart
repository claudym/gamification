import 'package:cloud_firestore/cloud_firestore.dart';

class Reward {
  final String id;
  final String title;
  final String description;
  final int pointCost;
  final String imageUrl;
  final String terms;

  Reward({
    required this.id,
    required this.title,
    required this.description,
    required this.pointCost,
    required this.imageUrl,
    required this.terms,
  });

  // Método para convertir un Map a Reward
  factory Reward.fromMap(Map<String, dynamic> map) {
    return Reward(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      pointCost: map['pointCost'] as int,
      imageUrl: map['imageUrl'] as String,
      terms: map['terms'] as String,
    );
  }

  static fromDocument(QueryDocumentSnapshot<Object?> doc) {}
}
