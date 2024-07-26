import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/extensions/element_model_extension.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/stores/application_store.dart';
import 'package:flutter_web_formbuilder/styles/icon_styles.dart';
import 'package:flutter_web_formbuilder/widgets/design_view_elements.dart';
import 'package:flutter_web_formbuilder/widgets/dialogs/delete_design_item_dialog.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';

enum FlexGridRowAction {
  addRowBefore,
  addRowAfter,
  deleteRow,
}

enum FlexGridColumnAction {
  addColumnBefore,
  addColumnAfter,
  deleteColumn,
}

class FlexGrid extends StatefulWidget {
  final double rowGap;
  final double columnGap;
  final ElementModel item;
  const FlexGrid({
    super.key,
    required this.item,
    this.rowGap = 2,
    this.columnGap = 2,
  });

  @override
  State<FlexGrid> createState() => _FlexGridState();
}

class _FlexGridState extends State<FlexGrid> {
  late final isGridEditable = createSignal<bool>(context, false);
  late final rowMenuActive = createSignal<int>(context, -1);
  late final columnMenuActive = createSignal<String>(context, '-1:-1');
  List<Widget> _generateRows(BuildContext context, ElementModel item) {
    final rowCount = item.getGridChildRowCount();
    return List.generate(
      rowCount,
      (rowIndex) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: rowIndex == rowCount - 1 ? 0 : widget.rowGap),
          child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
              color: rowMenuActive.value == rowIndex
                  ? Colors.grey.shade300
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(rowMenuActive.value == rowIndex ? 8 : 0),
            margin: EdgeInsetsGeometry.lerp(
              const EdgeInsets.all(0),
              const EdgeInsets.all(4),
              rowMenuActive.value == rowIndex ? 1 : 0,
            ),
            child: Row(
              children: [
                AnimatedCrossFade(
                  crossFadeState: isGridEditable.value
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 150),
                  firstChild: PopupMenuButton<FlexGridRowAction>(
                    tooltip: 'Row Actions',
                    color: Colors.white,
                    position: PopupMenuPosition.under,
                    initialValue: null,
                    itemBuilder: (context) {
                      return <PopupMenuEntry<FlexGridRowAction>>[
                        const PopupMenuItem(
                          value: FlexGridRowAction.addRowBefore,
                          child: Text('Add Row Before'),
                        ),
                        const PopupMenuItem(
                          value: FlexGridRowAction.addRowAfter,
                          child: Text('Add Row After'),
                        ),
                        const PopupMenuItem(
                          value: FlexGridRowAction.deleteRow,
                          child: Text('Delete Row'),
                        ),
                      ];
                    },
                    onSelected: (value) {
                      debugPrint('selected $value');
                      rowMenuActive.value = -1;
                    },
                    onOpened: () {
                      debugPrint('opened');
                      rowMenuActive.value = rowIndex;
                    },
                    onCanceled: () {
                      debugPrint('canceled');
                      rowMenuActive.value = -1;
                    },
                    icon: const Icon(
                      IconStyles.iconTableRow,
                    ),
                  ),
                  secondChild: const SizedBox.shrink(),
                ),
                if (isGridEditable.value) const Gap(4),
                ..._generateColumns(context, item, rowIndex),
              ],
            ),
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
              right: columnIndex == columnCount - 1 ? 0 : widget.columnGap,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeIn,
              padding: EdgeInsets.all(
                  columnMenuActive.value == '$rowIndex:$columnIndex' ? 8 : 4),
              constraints: const BoxConstraints(
                minHeight: 30,
              ),
              margin: EdgeInsetsGeometry.lerp(
                const EdgeInsets.all(0),
                const EdgeInsets.all(4),
                columnMenuActive.value == '$rowIndex:$columnIndex' ? 1 : 0,
              ),
              decoration: BoxDecoration(
                color: columnMenuActive.value == '$rowIndex:$columnIndex'
                    ? Colors.grey.shade400
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  AnimatedCrossFade(
                    crossFadeState: isGridEditable.value
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 200),
                    firstChild: PopupMenuButton<FlexGridColumnAction>(
                      color: Colors.white,
                      tooltip: 'Column Actions',
                      position: PopupMenuPosition.under,
                      initialValue: null,
                      itemBuilder: (context) {
                        return <PopupMenuEntry<FlexGridColumnAction>>[
                          const PopupMenuItem(
                            value: FlexGridColumnAction.addColumnBefore,
                            child: Text('Add Column Before'),
                          ),
                          const PopupMenuItem(
                            value: FlexGridColumnAction.addColumnAfter,
                            child: Text('Add Column After'),
                          ),
                          const PopupMenuItem(
                            value: FlexGridColumnAction.deleteColumn,
                            child: Text('Delete Column'),
                          ),
                        ];
                      },
                      onSelected: (value) {
                        debugPrint('selected $value');
                        columnMenuActive.value = '-1:-1';
                      },
                      onOpened: () {
                        debugPrint('opened');
                        columnMenuActive.value = '$rowIndex:$columnIndex';
                      },
                      onCanceled: () {
                        debugPrint('canceled');
                        columnMenuActive.value = '-1:-1';
                      },
                      icon: const Icon(
                        IconStyles.iconTableColumn,
                      ),
                    ),
                    secondChild: const SizedBox.shrink(),
                  ),
                  if (isGridEditable.value) const Gap(4),
                  Expanded(
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

                        final newItem = item.reorderGridChildInColumn(
                          rowIndex,
                          columnIndex,
                          oldIndex,
                          newIndex,
                        );

                        ApplicationStore.updateItem(newItem);
                      },
                      onDropBefore: (elementItem) {
                        final newItem = item.addGridChildFirstInColumn(
                          rowIndex: rowIndex,
                          columnIndex: columnIndex,
                          itemToAdd: elementItem,
                        );

                        ApplicationStore.updateItem(newItem);
                      },
                      onDropAfter: (elementItem, index) {
                        final newItem = item.addGridChildAtIndexInColumn(
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
                          final newItem = item.removeGridChildFromColumn(
                            rowIndex: rowIndex,
                            columnIndex: columnIndex,
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                isGridEditable.value = !isGridEditable.value;
              },
              icon: const Icon(
                IconStyles.iconGrid,
              ),
            ),
            const Gap(4),
            const Text('Grid'),
          ],
        ),
        ..._generateRows(context, widget.item),
      ],
    );
  }
}
