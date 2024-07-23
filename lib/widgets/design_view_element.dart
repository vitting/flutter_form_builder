import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/helpers/design_view_widget_helper.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/widgets/layouts/flex_grid.dart';
import 'package:flutter_web_formbuilder/widgets/layouts/flex_grid_container.dart';
import 'package:gap/gap.dart';

class DesignViewElement extends StatelessWidget {
  final int index;
  final ValueChanged<ElementModel>? onDelete;
  final ElementModel item;
  const DesignViewElement({
    super.key,
    required this.index,
    this.onDelete,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Row(
                children: [
                  ReorderableDragStartListener(
                    index: index,
                    child: const Icon(Icons.drag_handle),
                  ),
                  const Gap(16),
                  // const Flexible(child: FlexGridContainer()),
                  Flexible(
                    child: DesignViewWidgetHelper.getWidget(item),
                  ),
                ],
              ),
            ),
            const Gap(16),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                onDelete?.call(item);
              },
            ),
            const Gap(8),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                onDelete?.call(item);
              },
            )
          ],
        ),
      ),
    );
  }
}
