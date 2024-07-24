import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/stores/application_store.dart';
import 'package:flutter_web_formbuilder/stores/flex_grid_store.dart';
import 'package:flutter_web_formbuilder/widgets/design_view_elements.dart';
import 'package:flutter_web_formbuilder/widgets/dialogs/delete_design_item_dialog.dart';

class FlexGrid extends StatelessWidget {
  final double rowGap;
  final double columnGap;
  final ElementModel item;
  const FlexGrid({
    super.key,
    required this.item,
    this.rowGap = 1,
    this.columnGap = 1,
  });

  List<Widget> _generateRows(BuildContext context, ElementModel item) {
    if (item.rowCount == null) {
      return [];
    }

    return List.generate(
      item.rowCount!,
      (rowIndex) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: rowIndex == item.rowCount! - 1 ? 0 : rowGap),
          child: Row(
            children: _generateColumns(context, item, rowIndex),
          ),
        );
      },
    );
  }

  List<Widget> _generateColumns(
      BuildContext context, ElementModel item, int rowIndex) {
    if (item.columnCount == null) {
      return [];
    }

    return List.generate(
      item.columnCount!,
      (columnIndex) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: columnIndex == item.columnCount! - 1 ? 0 : columnGap,
            ),
            child: Container(
              padding: const EdgeInsets.all(4),
              constraints: const BoxConstraints(
                minHeight: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DesignViewElements(
                items: item.getGridChildren(rowIndex, columnIndex),
                highlightIdDragTargetZoneBefore:
                    'top_${columnIndex}_${rowIndex}_${item.id}',
                highlightIdDragTargetZoneAfter:
                    '${columnIndex}_${rowIndex}_${item.id}',
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }

                  final newItem = FlexGridStore.reorderGridChild(
                    item,
                    rowIndex,
                    columnIndex,
                    oldIndex,
                    newIndex,
                  );

                  ApplicationStore.updateItem(newItem);
                },
                onDropBefore: (elementItem) {
                  final newItem = FlexGridStore.addGridChildFirst(
                    item: item,
                    rowIndex: rowIndex,
                    columnIndex: columnIndex,
                    itemToAdd: elementItem,
                  );

                  ApplicationStore.updateItem(newItem);
                },
                onDropAfter: (elementItem, index) {
                  final newItem = FlexGridStore.addGridChildAtIndex(
                    item: item,
                    rowIndex: rowIndex,
                    columnIndex: columnIndex,
                    gridChildIndex: index,
                    itemToAdd: elementItem,
                  );

                  ApplicationStore.updateItem(newItem);
                },
                onDelete: (elementItem) async {
                  final delete = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return const DeleteDesignItemDialog();
                    },
                  );
                  if (delete != null && delete) {
                    final newItem = FlexGridStore.removeGridChild(
                      rowIndex: rowIndex,
                      columnIndex: columnIndex,
                      item: item,
                      itemToRemove: elementItem,
                    );

                    ApplicationStore.updateItem(newItem);
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Grid title'),
        ..._generateRows(context, item),
      ],
    );
  }
}
