import 'package:flutter/material.dart';
import 'package:internshala_search/widgets/space.dart';

class IconLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final double? iconSize;
  final double? textSize;
  final Color? color;
  const IconLabel({
    super.key,
    required this.icon,
    required this.label,
    this.iconSize,
    this.textSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: iconSize ?? 20, color: color),
        const Space(8, isHorizontal: true),
        Text(label, style: TextStyle(color: color, fontSize: textSize)),
      ],
    );
  }
}
