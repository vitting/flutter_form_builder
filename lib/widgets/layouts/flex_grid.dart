import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/extensions/element_model_extension.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/stores/application_store.dart';
import 'package:flutter_web_formbuilder/widgets/design_view_elements.dart';
import 'package:flutter_web_formbuilder/widgets/dialogs/delete_design_item_dialog.dart';

class FlexGrid extends StatelessWidget {
  final double rowGap;
  final double columnGap;
  final ElementModel item;
  const FlexGrid({
    super.key,
    required this.item,
    this.rowGap = 2,
    this.columnGap = 2,
  });

  List<Widget> _generateRows(BuildContext context, ElementModel item) {
    final rowCount = item.getGridChildRowCount();
    return List.generate(
      rowCount,
      (rowIndex) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: rowIndex == rowCount - 1 ? 0 : rowGap),
          child: Row(
            children: _generateColumns(context, item, rowIndex),
          ),
        );
      },
    );
  }

  List<Widget> _generateColumns(
      BuildContext context, ElementModel item, int rowIndex) {
    final columnCount = item.getGridChildColumnsCount(rowIndex);
    return List.generate(
      columnCount,
      (columnIndex) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: columnIndex == columnCount - 1 ? 0 : columnGap,
            ),
            child: Container(
              padding: const EdgeInsets.all(4),
              constraints: const BoxConstraints(
                minHeight: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DesignViewElements(
                items: item.getGridChildColumn(rowIndex, columnIndex),
                highlightIdDragTargetZoneBefore:
                    'top_${columnIndex}_${rowIndex}_${item.id}',
                highlightIdDragTargetZoneAfter:
                    '${columnIndex}_${rowIndex}_${item.id}',
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }

                  final newItem = item.reorderGridChild(
                    rowIndex,
                    columnIndex,
                    oldIndex,
                    newIndex,
                  );

                  ApplicationStore.updateItem(newItem);
                },
                onDropBefore: (elementItem) {
                  final newItem = item.addGridChildFirst(
                    rowIndex: rowIndex,
                    columnIndex: columnIndex,
                    itemToAdd: elementItem,
                  );

                  ApplicationStore.updateItem(newItem);
                },
                onDropAfter: (elementItem, index) {
                  final newItem = item.addGridChildAtIndex(
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
                    final newItem = item.removeGridChild(
                      rowIndex: rowIndex,
                      columnIndex: columnIndex,
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
        Text(item.title ?? ''),
        ..._generateRows(context, item),
      ],
    );
  }
}
