import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/helpers/design_view_widget_helper.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/stores/reorder_list_store.dart';
import 'package:flutter_web_formbuilder/styles/icon_styles.dart';
import 'package:flutter_web_formbuilder/widgets/design_view_element_card.dart';

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
    return DesignViewElementCard(
      leading: AnimatedCrossFade(
        duration: const Duration(milliseconds: 200),
        crossFadeState: ReorderListStore.reorderIsEnabled.value
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        firstChild: ReorderableDragStartListener(
          index: index,
          child: Icon(
            IconStyles.iconDragHandler,
            color: IconStyles.colorActionIcon,
          ),
        ),
        secondChild: const SizedBox.shrink(),
      ),
      trailing: AnimatedCrossFade(
        firstChild: Row(
          children: [
            IconButton(
              icon: Icon(
                IconStyles.iconDelete,
                color: IconStyles.colorActionIcon,
              ),
              onPressed: () {
                onDelete?.call(item);
              },
            ),
            IconButton(
              icon: Icon(
                IconStyles.iconEdit,
                color: IconStyles.colorActionIcon,
              ),
              onPressed: () {
                onDelete?.call(item);
              },
            )
          ],
        ),
        secondChild: const SizedBox.shrink(),
        crossFadeState: ReorderListStore.reorderIsEnabled.value
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 200),
      ),
      child: DesignViewWidgetHelper.getWidget(item),
    );
  }
}
