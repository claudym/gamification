import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  final String label;

  const ProgressBar({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8.0),
        LinearProgressIndicator(
          value: value,
          minHeight: 10,
        ),
        const SizedBox(height: 8.0),
        Text('${(value * 100).toStringAsFixed(0)}%'),
      ],
    );
  }
}
