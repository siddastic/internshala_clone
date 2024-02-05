import 'package:flutter/material.dart';

class PrimaryChip extends StatelessWidget {
  final String label;
  final VoidCallback? onDeleted;
  final double? radius;
  const PrimaryChip({
    super.key,
    required this.label,
    this.onDeleted,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: radius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius!),
            )
          : null,
      label: Text(label),
      onDeleted: onDeleted,
      deleteIcon: const Icon(Icons.close),
      deleteIconColor: Theme.of(context).colorScheme.primary,
      deleteButtonTooltipMessage: 'Remove this filter',
    );
  }
}
