import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/stores/application_store.dart';
import 'package:flutter_web_formbuilder/stores/reorder_list_store.dart';
import 'package:flutter_web_formbuilder/styles/icon_styles.dart';
import 'package:flutter_web_formbuilder/widgets/design_view_elements.dart';
import 'package:flutter_web_formbuilder/widgets/dialogs/delete_design_item_dialog.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    color: ReorderListStore.reorderIsEnabled.watch(context)
                        ? IconStyles.colorActionIconActive
                        : IconStyles.colorActionIcon,
                    tooltip: 'Reorder elements',
                    onPressed: () {
                      ReorderListStore.reorderIsEnabled.value =
                          !ReorderListStore.reorderIsEnabled.value;
                    },
                    icon: const Icon(
                      IconStyles.iconDragHandler,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(8),
          Expanded(
            child: SingleChildScrollView(
              child: DesignViewElements(
                items: ApplicationStore.items,
                highlightIdDragTargetZoneBefore: 'top',
                highlightIdDragTargetZoneAfter: 'bottom',
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final item = ApplicationStore.items.removeAt(oldIndex);
                  ApplicationStore.items.insert(newIndex, item);
                },
                onDropBefore: (elementItem) {
                  ApplicationStore.items.insert(0, elementItem);
                },
                onDropAfter: (elementItem, index) {
                  ApplicationStore.items.insert(index + 1, elementItem);
                },
                onDelete: (value) async {
                  final delete = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return const DeleteDesignItemDialog();
                    },
                  );
                  if (delete != null && delete) {
                    ApplicationStore.items.remove(value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
