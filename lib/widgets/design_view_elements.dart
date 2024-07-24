import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/widgets/design_view_element.dart';
import 'package:flutter_web_formbuilder/widgets/drop_target_zone.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';

class DesignViewElements extends StatelessWidget {
  final Iterable<ElementModel> items;
  final String highlightIdDragTargetZoneBefore;
  final String highlightIdDragTargetZoneAfter;
  final ValueChanged<ElementModel>? onDropBefore;
  final Function(ElementModel, int)? onDropAfter;
  final ValueChanged<ElementModel>? onDelete;
  final Function(int, int) onReorder;

  const DesignViewElements({
    super.key,
    required this.items,
    required this.highlightIdDragTargetZoneBefore,
    required this.highlightIdDragTargetZoneAfter,
    this.onDropBefore,
    this.onDropAfter,
    this.onDelete,
    required this.onReorder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        DropTargetZone(
          highlightId: highlightIdDragTargetZoneBefore,
          onDrop: onDropBefore,
        ),
        Gap(items.isEmpty ? 0 : 8),
        Watch.builder(builder: (context) {
          return ReorderableListView.builder(
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
                  ),
                  const Gap(8),
                  DropTargetZone(
                    highlightId: items.elementAt(index).id,
                    onDrop: (elementItem) {
                      onDropAfter?.call(elementItem, index);
                    },
                  ),
                  const Gap(8),
                ],
              );
            },
          );
        })
      ],
    );
  }
}
