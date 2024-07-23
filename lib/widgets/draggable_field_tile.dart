import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:flutter_web_formbuilder/widgets/field_tile.dart';

class DraggableFieldTile extends StatelessWidget {
  final VoidCallback? onDragStarted;
  final Function(DraggableDetails)? onDragEnd;
  final DragInfo dragInfo;
  final Icon icon;
  final String title;
  const DraggableFieldTile({
    super.key,
    this.onDragStarted,
    this.onDragEnd,
    required this.dragInfo,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<DragInfo>(
      data: dragInfo,
      feedback: Material(
        color: Colors.transparent,
        child: FieldTile(
          title: title,
          icon: icon,
          isDragged: true,
        ),
      ),
      childWhenDragging: FieldTile(
        title: title,
        icon: icon,
        isActive: true,
      ),
      onDragStarted: onDragStarted,
      onDragEnd: onDragEnd,
      child: FieldTile(
        title: title,
        icon: icon,
      ),
    );
  }
}
