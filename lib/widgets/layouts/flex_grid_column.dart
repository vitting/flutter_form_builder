import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/enums/flex_grid_action_enum.dart';
import 'package:flutter_web_formbuilder/extensions/element_model_extension.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/stores/application_store.dart';
import 'package:flutter_web_formbuilder/stores/flex_grid_store.dart';
import 'package:flutter_web_formbuilder/styles/icon_styles.dart';
import 'package:flutter_web_formbuilder/widgets/design_view_elements.dart';
import 'package:flutter_web_formbuilder/widgets/dialogs/delete_design_item_dialog.dart';
import 'package:flutter_web_formbuilder/widgets/layouts/flex_grid_edit.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';

class FlexGridColumn extends StatelessWidget {
  final double columnGap;
  final bool isGridEditable;
  final ElementModel item;
  final int rowIndex;
  final int columnIndex;
  const FlexGridColumn({
    super.key,
    this.columnGap = 2,
    this.isGridEditable = false,
    required this.item,
    required this.rowIndex,
    required this.columnIndex,
  });

  String get _columnSignature {
    return '$rowIndex:$columnIndex';
  }

  void _onMenuAction(FlexGridAction value) {
    switch (value) {
      case FlexGridAction.addBefore:
        final newItem = item.addGridColumnBefore(rowIndex, columnIndex);
        ApplicationStore.updateItem(newItem);
        break;
      case FlexGridAction.addAfter:
        final newItem = item.addGridColumnAfter(rowIndex, columnIndex);
        ApplicationStore.updateItem(newItem);
        break;
      case FlexGridAction.delete:
        final newItem = item.removeGridColumn(rowIndex, columnIndex);
        ApplicationStore.updateItem(newItem);
        break;
    }
  }

  void _onDropBefore(ElementModel elementItem) {
    final newItem = item.addGridChildFirstInColumn(
      rowIndex: rowIndex,
      columnIndex: columnIndex,
      itemToAdd: elementItem,
    );

    ApplicationStore.updateItem(newItem);
  }

  void _onDropAfter(ElementModel elementItem, int index) {
    final newItem = item.addGridChildAtIndexInColumn(
      rowIndex: rowIndex,
      columnIndex: columnIndex,
      gridChildIndex: index,
      itemToAdd: elementItem,
    );

    ApplicationStore.updateItem(newItem);
  }

  void _onDelete(BuildContext context, ElementModel itemToRemove) async {
    final delete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return const DeleteDesignItemDialog();
      },
    );
    if (delete != null && delete) {
      final newItem = item.removeGridChildFromColumn(
        rowIndex: rowIndex,
        columnIndex: columnIndex,
        itemToRemove: itemToRemove,
      );

      ApplicationStore.updateItem(newItem);
    }
  }

  void _onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final newItem = item.reorderGridChildInColumn(
      rowIndex,
      columnIndex,
      oldIndex,
      newIndex,
    );

    ApplicationStore.updateItem(newItem);
  }

  @override
  Widget build(BuildContext context) {
    final columnCount = item.getGridChildColumnsCount(rowIndex);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          right: columnIndex == columnCount - 1 ? 0 : columnGap,
        ),
        child: Watch.builder(builder: (context) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeIn,
            padding: EdgeInsets.all(
                FlexGridStore.columnMenuActive.value == _columnSignature
                    ? 8
                    : 4),
            constraints: const BoxConstraints(
              minHeight: 48,
            ),
            margin: EdgeInsetsGeometry.lerp(
              const EdgeInsets.all(0),
              const EdgeInsets.all(4),
              FlexGridStore.columnMenuActive.value == _columnSignature ? 1 : 0,
            ),
            decoration: BoxDecoration(
              color: FlexGridStore.columnMenuActive.value == _columnSignature
                  ? Colors.grey.shade400
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                FlexGridEdit(
                  isGridEditable: isGridEditable,
                  icon: IconStyles.iconTableColumn,
                  typeText: 'Column',
                  onMenuActivated: () {
                    FlexGridStore.columnMenuActive.value = _columnSignature;
                  },
                  onMenuDeactivated: () {
                    FlexGridStore.columnMenuActive.value = '-1:-1';
                  },
                  onActionSelected: _onMenuAction,
                ),
                if (isGridEditable) const Gap(4),
                Expanded(
                  child: DesignViewElements(
                    parentItem: item,
                    items: item.getGridChildColumn(rowIndex, columnIndex),
                    highlightIdDragTargetZoneBefore:
                        'top_${columnIndex}_${rowIndex}_${item.id}',
                    highlightIdDragTargetZoneAfter:
                        '${columnIndex}_${rowIndex}_${item.id}',
                    onReorder: _onReorder,
                    onDropBefore: _onDropBefore,
                    onDropAfter: _onDropAfter,
                    onDelete: (elementItem) {
                      _onDelete(context, elementItem);
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
