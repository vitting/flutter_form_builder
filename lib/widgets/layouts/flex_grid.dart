import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/extensions/element_model_extension.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/stores/flex_grid_store.dart';
import 'package:flutter_web_formbuilder/styles/icon_styles.dart';
import 'package:flutter_web_formbuilder/widgets/layouts/flex_grid_row.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';

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
  // late final isGridEditable = createSignal<bool>(context, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (FlexGridStore.gridEditableId.value == widget.item.id) {
                  FlexGridStore.gridEditableId.value = '';
                } else {
                  FlexGridStore.gridEditableId.value = widget.item.id;
                }
              },
              icon: const Icon(
                IconStyles.iconGrid,
              ),
            ),
            const Gap(4),
            const Text(
              'Grid',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        ...List.generate(
          widget.item.getGridChildRowCount(),
          (rowIndex) {
            return FlexGridRow(
              rowGap: widget.rowGap,
              item: widget.item,
              rowIndex: rowIndex,
            );
          },
        )
      ],
    );
  }
}
