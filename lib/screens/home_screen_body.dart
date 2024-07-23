import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/stores/application_store.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropTargetZone(
              highlightId: 'top',
              onDrop: (dropInfo) {
                ApplicationStore.items.insert(0, dropInfo);
              },
            ),
            const Gap(5),
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
                      Card(
                        child: ListTile(
                          title: Text(ApplicationStore.items[index].title),
                          leading: ReorderableDragStartListener(
                            index: index,
                            child: const Icon(Icons.drag_handle),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              ApplicationStore.items.removeAt(index);
                            },
                          ),
                        ),
                      ),
                      const Gap(5),
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
