import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/stores/application_store.dart';
import 'package:flutter_web_formbuilder/widgets/design_view_element.dart';
import 'package:flutter_web_formbuilder/widgets/dialogs/delete_design_item_dialog.dart';
import 'package:flutter_web_formbuilder/widgets/drop_target_zone.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            DropTargetZone(
              highlightId: 'top',
              onDrop: (dropInfo) {
                ApplicationStore.items.insert(0, dropInfo);
              },
            ),
            const Gap(8),
            Watch.builder(builder: (context) {
              return ReorderableListView.builder(
                buildDefaultDragHandles: false,
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final item = ApplicationStore.items.removeAt(oldIndex);
                  ApplicationStore.items.insert(newIndex, item);
                },
                shrinkWrap: true,
                itemCount: ApplicationStore.items.length,
                itemBuilder: (context, index) {
                  return Column(
                    key: ValueKey(ApplicationStore.items[index].id),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DesignViewElement(
                          index: index,
                          item: ApplicationStore.items[index],
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
                          }),
                      const Gap(8),
                      DropTargetZone(
                        onDrop: (dropInfo) {
                          ApplicationStore.items.insert(index + 1, dropInfo);
                        },
                        highlightId: ApplicationStore.items[index].id,
                      ),
                    ],
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
