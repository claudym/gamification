import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final List<String> badges;

  BadgeWidget({required this.badges});

  @override
  Widget build(BuildContext context) {
    if (badges.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Badges',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Wrap(
          spacing: 8.0,
          children: badges.map((badge) {
            return Chip(
              label: Text(badge),
              avatar: Icon(Icons.star, color: Colors.amber),
            );
          }).toList(),
        ),
      ],
    );
  }
}
