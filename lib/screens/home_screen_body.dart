import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/stores/application_store.dart';
import 'package:flutter_web_formbuilder/widgets/design_view_elements.dart';
import 'package:flutter_web_formbuilder/widgets/dialogs/delete_design_item_dialog.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
    );
  }
}
