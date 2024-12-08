import 'package:cloud_firestore/cloud_firestore.dart';

class Training {
  final String id;
  final String name;
  final DateTime date;

  Training({required this.id, required this.name, required this.date});

  factory Training.fromMap(Map<String, dynamic> data) {
    return Training(
      id: data['id'],
      name: data['name'],
      date: (data['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
    };
  }
}
