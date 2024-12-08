import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamification/models/training.dart';

class SearchProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Training> _searchResults = [];
  String _searchQuery = '';

  List<Training> get searchResults => _searchResults;
  String get searchQuery => _searchQuery;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
    _performSearch();
  }

  Future<void> _performSearch() async {
    if (_searchQuery.isEmpty) {
      _searchResults = [];
      notifyListeners();
      return;
    }

    try {
      QuerySnapshot snapshot = await _firestore
          .collection('trainings')
          .where('name', isGreaterThanOrEqualTo: _searchQuery)
          .where('name', isLessThanOrEqualTo: '$_searchQuery\uf8ff')
          .get();

      _searchResults = snapshot.docs
          .map((doc) => Training.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      notifyListeners();
    } catch (e) {
      print('Error performing search: $e');
      // Handle error
    }
  }
}
