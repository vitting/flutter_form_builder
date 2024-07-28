import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/enums/flex_grid_action_enum.dart';
import 'package:flutter_web_formbuilder/extensions/element_model_extension.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/stores/application_store.dart';
import 'package:flutter_web_formbuilder/styles/icon_styles.dart';
import 'package:flutter_web_formbuilder/widgets/design_view_elements.dart';
import 'package:flutter_web_formbuilder/widgets/dialogs/delete_design_item_dialog.dart';
import 'package:flutter_web_formbuilder/widgets/layouts/flex_grid_edit.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';

class FlexGridColumn extends StatefulWidget {
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

  @override
  State<FlexGridColumn> createState() => _FlexGridColumnState();
}

class _FlexGridColumnState extends State<FlexGridColumn> {
  late String columnSignature = '${widget.rowIndex}:${widget.columnIndex}';
  late final columnMenuActive = createSignal<String>(context, '-1:-1');

  void onMenuAction(FlexGridAction value) {
    switch (value) {
      case FlexGridAction.addBefore:
        final newItem = widget.item
            .addGridColumnBefore(widget.rowIndex, widget.columnIndex);
        ApplicationStore.updateItem(newItem);
        break;
      case FlexGridAction.addAfter:
        final newItem =
            widget.item.addGridColumnAfter(widget.rowIndex, widget.columnIndex);
        ApplicationStore.updateItem(newItem);
        break;
      case FlexGridAction.delete:
        final newItem =
            widget.item.removeGridColumn(widget.rowIndex, widget.columnIndex);
        ApplicationStore.updateItem(newItem);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final columnCount = widget.item.getGridChildColumnsCount(widget.rowIndex);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          right: widget.columnIndex == columnCount - 1 ? 0 : widget.columnGap,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeIn,
          padding:
              EdgeInsets.all(columnMenuActive.value == columnSignature ? 8 : 4),
          constraints: const BoxConstraints(
            minHeight: 30,
          ),
          margin: EdgeInsetsGeometry.lerp(
            const EdgeInsets.all(0),
            const EdgeInsets.all(4),
            columnMenuActive.value == columnSignature ? 1 : 0,
          ),
          decoration: BoxDecoration(
            color: columnMenuActive.value == columnSignature
                ? Colors.grey.shade400
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              FlexGridEdit(
                isGridEditable: widget.isGridEditable,
                icon: IconStyles.iconTableColumn,
                typeText: 'Column',
                onMenuActivated: () {
                  columnMenuActive.value = columnSignature;
                },
                onMenuDeactivated: () {
                  columnMenuActive.value = '-1:-1';
                },
                onActionSelected: onMenuAction,
              ),
              if (widget.isGridEditable) const Gap(4),
              Expanded(
                child: DesignViewElements(
                  parentItem: widget.item,
                  items: widget.item
                      .getGridChildColumn(widget.rowIndex, widget.columnIndex),
                  highlightIdDragTargetZoneBefore:
                      'top_${widget.columnIndex}_${widget.rowIndex}_${widget.item.id}',
                  highlightIdDragTargetZoneAfter:
                      '${widget.columnIndex}_${widget.rowIndex}_${widget.item.id}',
                  onReorder: (oldIndex, newIndex) {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }

                    final newItem = widget.item.reorderGridChildInColumn(
                      widget.rowIndex,
                      widget.columnIndex,
                      oldIndex,
                      newIndex,
                    );

                    ApplicationStore.updateItem(newItem);
                  },
                  onDropBefore: (elementItem) {
                    final newItem = widget.item.addGridChildFirstInColumn(
                      rowIndex: widget.rowIndex,
                      columnIndex: widget.columnIndex,
                      itemToAdd: elementItem,
                    );

                    ApplicationStore.updateItem(newItem);
                  },
                  onDropAfter: (elementItem, index) {
                    final newItem = widget.item.addGridChildAtIndexInColumn(
                      rowIndex: widget.rowIndex,
                      columnIndex: widget.columnIndex,
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
                      final newItem = widget.item.removeGridChildFromColumn(
                        rowIndex: widget.rowIndex,
                        columnIndex: widget.columnIndex,
                        itemToRemove: elementItem,
                      );

                      ApplicationStore.updateItem(newItem);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
