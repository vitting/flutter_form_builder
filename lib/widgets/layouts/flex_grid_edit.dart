import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/enums/flex_grid_action_enum.dart';

class FlexGridEdit extends StatelessWidget {
  final bool isGridEditable;
  final VoidCallback? onMenuActivated;
  final VoidCallback? onMenuDeactivated;
  final ValueChanged<FlexGridAction>? onActionSelected;
  final IconData icon;
  final String typeText;
  const FlexGridEdit({
    super.key,
    required this.isGridEditable,
    this.onMenuActivated,
    this.onMenuDeactivated,
    this.onActionSelected,
    required this.icon,
    required this.typeText,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState:
          isGridEditable ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 200),
      firstChild: PopupMenuButton<FlexGridAction>(
        color: Colors.white,
        tooltip: '$typeText Actions',
        position: PopupMenuPosition.under,
        initialValue: null,
        itemBuilder: (context) {
          return <PopupMenuEntry<FlexGridAction>>[
            PopupMenuItem(
              value: FlexGridAction.addBefore,
              child: Text('Add $typeText Before'),
            ),
            PopupMenuItem(
              value: FlexGridAction.addAfter,
              child: Text('Add $typeText After'),
            ),
            PopupMenuItem(
              value: FlexGridAction.delete,
              child: Text('Delete $typeText'),
            ),
          ];
        },
        onSelected: (value) {
          debugPrint('selected $value');
          onActionSelected?.call(value);
          onMenuDeactivated?.call();
        },
        onOpened: () {
          debugPrint('opened');
          onMenuActivated?.call();
        },
        onCanceled: () {
          debugPrint('canceled');
          onMenuDeactivated?.call();
        },
        icon: Icon(icon),
      ),
      secondChild: const SizedBox.shrink(),
    );
  }
}
