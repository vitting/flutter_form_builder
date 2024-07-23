import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:flutter_web_formbuilder/stores/drag_and_drop_store.dart';
import 'package:flutter_web_formbuilder/widgets/draggable_field_tile.dart';

class HomeScreenToolbar extends StatefulWidget {
  const HomeScreenToolbar({super.key});

  @override
  State<HomeScreenToolbar> createState() => _HomeScreenToolbarState();
}

class _HomeScreenToolbarState extends State<HomeScreenToolbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 250,
        maxWidth: 250,
      ),
      color: Colors.amber,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DraggableFieldTile(
            dragInfo: DragInfo(
              id: 'ed6c160f-4a41-423a-8da2-a1689b59313e',
              type: DragInfoType.input,
              description: 'Ths is a text field',
              title: 'Text field',
            ),
            icon: const Icon(Icons.text_fields),
            title: 'Text field',
            onDragStarted: () {
              DragAndDropStore.showDropTarget.value = true;
              DragAndDropStore.dropIcon.value = Icons.text_fields;
              DragAndDropStore.dropTitle.value = 'Text field';
            },
            onDragEnd: (details) {
              DragAndDropStore.showDropTarget.value = false;
              DragAndDropStore.dropIcon.value = null;
              DragAndDropStore.dropTitle.value = null;
            },
          ),
          DraggableFieldTile(
            dragInfo: DragInfo(
              id: 'ed6c160f-4a41-423a-8da2-a1689b59313e',
              type: DragInfoType.input,
              description: 'This is a number field',
              title: 'Number field',
            ),
            icon: const Icon(Icons.numbers),
            title: 'Number field',
            onDragStarted: () {
              DragAndDropStore.showDropTarget.value = true;
              DragAndDropStore.dropIcon.value = Icons.numbers;
              DragAndDropStore.dropTitle.value = 'Number field';
            },
            onDragEnd: (details) {
              DragAndDropStore.showDropTarget.value = false;
              DragAndDropStore.dropIcon.value = null;
              DragAndDropStore.dropTitle.value = null;
            },
          ),
        ],
      ),
    );
  }
}
