import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FieldTile extends StatelessWidget {
  final String title;
  final Icon icon;
  final bool isDragged;
  final bool isActive;
  const FieldTile({
    super.key,
    required this.title,
    required this.icon,
    this.isDragged = false,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: isDragged ? 250 : 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: isDragged
              ? Colors.black.withOpacity(0.5)
              : isActive
                  ? Colors.black.withOpacity(0.5)
                  : Colors.black,
        ),
        borderRadius: BorderRadius.circular(16),
        color: isDragged
            ? Colors.white.withOpacity(0.5)
            : isActive
                ? Colors.white.withOpacity(0.3)
                : Colors.white,
      ),
      child: Row(
        children: [
          icon,
          const Gap(8),
          Text(title),
        ],
      ),
    );
  }
}
