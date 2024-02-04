import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class PlaceholderBox extends StatelessWidget {
  final double width;
  const PlaceholderBox({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        width: width,
        height: 20,
        decoration: BoxDecoration(
          color: const Color(0xff292929),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
