import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/enums/flex_grid_row_action_enum.dart';
import 'package:flutter_web_formbuilder/extensions/element_model_extension.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/styles/icon_styles.dart';
import 'package:flutter_web_formbuilder/widgets/layouts/flex_grid_column.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';

class FlexGridRow extends StatefulWidget {
  final double rowGap;
  final double columnGap;
  final bool isGridEditable;
  final int rowIndex;
  final ElementModel item;
  const FlexGridRow({
    super.key,
    this.rowGap = 2,
    this.columnGap = 2,
    this.isGridEditable = false,
    required this.rowIndex,
    required this.item,
  });

  @override
  State<FlexGridRow> createState() => _FlexGridRowState();
}

class _FlexGridRowState extends State<FlexGridRow> {
  late final rowMenuActive = createSignal<int>(context, -1);

  List<Widget> _generateColumns(
      BuildContext context, ElementModel item, int rowIndex) {
    return List.generate(
      item.getGridChildColumnsCount(rowIndex),
      (columnIndex) {
        return FlexGridColumn(
          columnGap: widget.columnGap,
          isGridEditable: widget.isGridEditable,
          item: item,
          rowIndex: rowIndex,
          columnIndex: columnIndex,
        );
      },
    );
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
              ? Colors.grey.shade300
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(rowMenuActive.value == widget.rowIndex ? 8 : 0),
        margin: EdgeInsetsGeometry.lerp(
          const EdgeInsets.all(0),
          const EdgeInsets.all(4),
          rowMenuActive.value == widget.rowIndex ? 1 : 0,
        ),
        child: Row(
          children: [
            AnimatedCrossFade(
              crossFadeState: widget.isGridEditable
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
                  rowMenuActive.value = widget.rowIndex;
                },
                onCanceled: () {
                  rowMenuActive.value = -1;
                },
                icon: const Icon(
                  IconStyles.iconTableRow,
                ),
              ),
              secondChild: const SizedBox.shrink(),
            ),
            if (widget.isGridEditable) const Gap(4),
            ..._generateColumns(context, widget.item, widget.rowIndex),
          ],
        ),
      ),
    );
  }
}
