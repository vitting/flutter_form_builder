import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/enums/flex_grid_action_enum.dart';
import 'package:flutter_web_formbuilder/extensions/element_model_extension.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/stores/application_store.dart';
import 'package:flutter_web_formbuilder/stores/flex_grid_store.dart';
import 'package:flutter_web_formbuilder/styles/icon_styles.dart';
import 'package:flutter_web_formbuilder/widgets/layouts/flex_grid_column.dart';
import 'package:flutter_web_formbuilder/widgets/layouts/flex_grid_edit.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';

class FlexGridRow extends StatefulWidget {
  final double rowGap;
  final double columnGap;

  final int rowIndex;
  final ElementModel item;
  const FlexGridRow({
    super.key,
    this.rowGap = 2,
    this.columnGap = 2,
    required this.rowIndex,
    required this.item,
  });

  @override
  State<FlexGridRow> createState() => _FlexGridRowState();
}

class _FlexGridRowState extends State<FlexGridRow> {
  late final rowMenuActive = createSignal<int>(context, -1);

  void onMenuAction(FlexGridAction value) {
    switch (value) {
      case FlexGridAction.addBefore:
        final newItem = widget.item.addGridRowBefore(widget.rowIndex);
        ApplicationStore.updateItem(newItem);
        break;
      case FlexGridAction.addAfter:
        final newItem = widget.item.addGridRowAfter(widget.rowIndex);
        ApplicationStore.updateItem(newItem);
        break;
      case FlexGridAction.delete:
        final newItem = widget.item.removeGridRow(widget.rowIndex);
        ApplicationStore.updateItem(newItem);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rowCount = widget.item.getGridChildRowCount();
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.rowIndex == rowCount - 1 ? 0 : widget.rowGap,
      ),
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: rowMenuActive.value == widget.rowIndex
              ? Colors.grey.shade400
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(rowMenuActive.value == widget.rowIndex ? 8 : 0),
        margin: EdgeInsetsGeometry.lerp(
          const EdgeInsets.all(0),
          const EdgeInsets.all(4),
          rowMenuActive.value == widget.rowIndex ? 1 : 0,
        ),
        child: Watch.builder(builder: (context) {
          return Row(
            children: [
              FlexGridEdit(
                isGridEditable:
                    FlexGridStore.gridEditableId.value == widget.item.id,
                icon: IconStyles.iconTableRow,
                typeText: 'Row',
                onMenuActivated: () {
                  rowMenuActive.value = widget.rowIndex;
                },
                onMenuDeactivated: () {
                  rowMenuActive.value = -1;
                },
                onActionSelected: onMenuAction,
              ),
              if (FlexGridStore.gridEditableId.value == widget.item.id)
                const Gap(4),
              ...List.generate(
                widget.item.getGridChildColumnsCount(widget.rowIndex),
                (columnIndex) {
                  return FlexGridColumn(
                    columnGap: widget.columnGap,
                    isGridEditable:
                        FlexGridStore.gridEditableId.value == widget.item.id,
                    item: widget.item,
                    rowIndex: widget.rowIndex,
                    columnIndex: columnIndex,
                  );
                },
              )
            ],
          );
        }),
      ),
    );
  }
}
