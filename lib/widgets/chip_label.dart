import 'package:flutter/material.dart';

class ChipLabel extends StatelessWidget {
  final String label;
  const ChipLabel({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xff292929),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label),
    );
  }
}
