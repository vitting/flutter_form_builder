import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/stores/application_store.dart';
import 'package:flutter_web_formbuilder/widgets/design_view_elements.dart';
import 'package:flutter_web_formbuilder/widgets/dialogs/delete_design_item_dialog.dart';

class FlexGrid extends StatefulWidget {
  final double rowGap;
  final double columnGap;
  final ElementModel item;
  const FlexGrid({
    super.key,
    required this.item,
    this.rowGap = 1,
    this.columnGap = 1,
  });

  @override
  State<FlexGrid> createState() => _FlexGridState();
}

class _FlexGridState extends State<FlexGrid> {
  List<Widget> _generateRows(ElementModel item) {
    if (item.rowCount == null) {
      return [];
    }

    return List.generate(
      item.rowCount!,
      (rowIndex) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: rowIndex == item.rowCount! - 1 ? 0 : widget.rowGap),
          child: Row(
            children: _generateColumns(item, rowIndex),
          ),
        );
      },
    );
  }

  List<Widget> _generateColumns(ElementModel item, int rowIndex) {
    if (item.columnCount == null) {
      return [];
    }

    return List.generate(
      item.columnCount!,
      (columnIndex) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right:
                  columnIndex == item.columnCount! - 1 ? 0 : widget.columnGap,
            ),
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
              ),
              child: DesignViewElements(
                items: item.getGridChildren(rowIndex, columnIndex),
                highlightIdDragTargetZoneBefore:
                    'top_${columnIndex}_${rowIndex}_${item.id}',
                highlightIdDragTargetZoneAfter:
                    '${columnIndex}_${rowIndex}_${item.id}',
                onReorder: (oldIndex, newIndex) {}, // TODO: Create REORDER
                onDropBefore: (elementItem) {
                  final newItem = item.addGridChildFirstAndGetCopyOf(
                    item: elementItem,
                    rowIndex: rowIndex,
                    columnIndex: columnIndex,
                  );

                  ApplicationStore.updateItem(newItem);
                },
                onDropAfter: (elementItem, index) {
                  final newItem = item.addGridChildAtIndexAndGetCopyOf(
                    item: elementItem,
                    rowIndex: rowIndex,
                    columnIndex: columnIndex,
                    gridChildIndex: index,
                  );

                  ApplicationStore.updateItem(newItem);
                },
                onDelete: (value) async {
                  final delete = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return const DeleteDesignItemDialog();
                    },
                  );
                  if (delete != null && delete) {
                    ApplicationStore.items.remove(value);
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
        ..._generateRows(widget.item),
      ],
    );
  }
}
