import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:flutter_web_formbuilder/stores/drag_and_drop_store.dart';
import 'package:flutter_web_formbuilder/widgets/field_tile.dart';

class DraggableFieldTile extends StatelessWidget {
  final DragInfo dragInfo;
  final IconData icon;
  const DraggableFieldTile({
    super.key,
    required this.dragInfo,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<DragInfo>(
      data: dragInfo,
      feedback: Material(
        color: Colors.transparent,
        child: FieldTile(
          title: dragInfo.title,
          icon: Icon(icon),
          isDragged: true,
        ),
      ),
      childWhenDragging: FieldTile(
        title: dragInfo.title,
        icon: Icon(icon),
        isActive: true,
      ),
      onDragStarted: () {
        DragAndDropStore.showDropTarget.value = true;
        DragAndDropStore.dropIcon.value = icon;
        DragAndDropStore.dropTitle.value = dragInfo.title;
      },
      onDragEnd: (_) {
        DragAndDropStore.showDropTarget.value = false;
        DragAndDropStore.dropIcon.value = null;
        DragAndDropStore.dropTitle.value = null;
      },
      child: FieldTile(
        title: dragInfo.title,
        icon: Icon(icon),
      ),
    );
  }
}
