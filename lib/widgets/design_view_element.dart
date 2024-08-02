import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/helpers/design_view_widget_helper.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/stores/flex_grid_store.dart';
import 'package:flutter_web_formbuilder/stores/reorder_list_store.dart';
import 'package:flutter_web_formbuilder/styles/icon_styles.dart';
import 'package:flutter_web_formbuilder/widgets/design_view_element_card.dart';
import 'package:signals/signals_flutter.dart';

class DesignViewElement extends StatelessWidget {
  final int index;
  final ValueChanged<ElementModel>? onDelete;
  final ValueChanged<ElementModel>? onEdit;
  final ElementModel item;

  const DesignViewElement({
    super.key,
    required this.index,
    this.onDelete,
    this.onEdit,
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
      trailing: Watch.builder(builder: (context) {
        return AnimatedCrossFade(
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
                  onEdit?.call(item);
                },
              )
            ],
          ),
          secondChild: const SizedBox.shrink(),
          crossFadeState: ReorderListStore.reorderIsEnabled.value ||
                  FlexGridStore.gridEditableId.value == item.parentId
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        );
      }),
      child: DesignViewWidgetHelper.getWidget(item),
    );
  }
}
