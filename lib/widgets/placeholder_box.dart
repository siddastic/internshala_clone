import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class PlaceholderBox extends StatelessWidget {
  final double width;
  final bool shimmerEnabled;
  final double? height;
  const PlaceholderBox({
    super.key,
    required this.width,
    this.shimmerEnabled = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      enabled: shimmerEnabled,
      child: Container(
        width: width,
        height: height ?? 20,
        decoration: BoxDecoration(
          color: const Color(0xff292929),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
