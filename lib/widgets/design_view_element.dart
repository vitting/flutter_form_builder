import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/helpers/design_view_widget_helper.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/styles/icon_styles.dart';
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
      color: Colors.white,
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
                    child: Icon(
                      Icons.drag_handle,
                      color: IconStyles.actionIconColor,
                    ),
                  ),
                  const Gap(16),
                  Flexible(
                    child: DesignViewWidgetHelper.getWidget(item),
                  ),
                ],
              ),
            ),
            const Gap(16),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: IconStyles.actionIconColor,
              ),
              onPressed: () {
                onDelete?.call(item);
              },
            ),
            const Gap(8),
            IconButton(
              icon: Icon(
                Icons.edit,
                color: IconStyles.actionIconColor,
              ),
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
