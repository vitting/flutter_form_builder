import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/widgets/design_view_element.dart';
import 'package:flutter_web_formbuilder/widgets/drop_target_zone.dart';
import 'package:signals/signals_flutter.dart';

class DesignViewElements extends StatelessWidget {
  final Iterable<ElementModel> items;
  final String highlightIdDragTargetZoneBefore;
  final String highlightIdDragTargetZoneAfter;
  final ValueChanged<ElementModel>? onDropBefore;
  final Function(ElementModel, int)? onDropAfter;
  final ValueChanged<ElementModel>? onDelete;
  final ValueChanged<ElementModel>? onEdit;
  final Function(int, int) onReorder;
  final ElementModel? parentItem;

  const DesignViewElements({
    super.key,
    required this.items,
    required this.highlightIdDragTargetZoneBefore,
    required this.highlightIdDragTargetZoneAfter,
    this.onDropBefore,
    this.onDropAfter,
    this.onDelete,
    this.onEdit,
    required this.onReorder,
    this.parentItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropTargetZone(
          highlightId: highlightIdDragTargetZoneBefore,
          onDrop: onDropBefore,
          parentItem: parentItem,
        ),
        Watch.builder(builder: (context) {
          // The ConstrainedBox is used to create a ViewPort for
          //the ReorderableListView to be able to scroll
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: ReorderableListView.builder(
              itemCount: items.length,
              buildDefaultDragHandles: false,
              onReorder: onReorder,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = items.elementAt(index);
                return Column(
                  key: ValueKey(item.id),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DesignViewElement(
                      index: index,
                      item: items.elementAt(index),
                      onDelete: onDelete,
                      onEdit: onEdit,
                    ),
                    DropTargetZone(
                      highlightId: items.elementAt(index).id,
                      onDrop: (elementItem) {
                        onDropAfter?.call(elementItem, index);
                      },
                      parentItem: parentItem,
                    ),
                  ],
                );
              },
            ),
          );
        })
      ],
    );
  }
}
