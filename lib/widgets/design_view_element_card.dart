import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DesignViewElementCard extends StatelessWidget {
  final Widget? trailing;
  final Widget? leading;
  final Widget child;
  const DesignViewElementCard({
    super.key,
    this.leading,
    this.trailing,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Row(
                children: [
                  if (leading != null) leading!,
                  const Gap(16),
                  Flexible(
                    child: child,
                  ),
                ],
              ),
            ),
            const Gap(16),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
