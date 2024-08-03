import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/enums/element_type_enum.dart';
import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/stores/drag_and_drop_store.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';

class DropTargetZone extends StatelessWidget {
  final ValueChanged<ElementModel>? onDrop;
  final String highlightId;
  final ElementModel? parentItem;
  const DropTargetZone({
    super.key,
    this.onDrop,
    required this.highlightId,
    this.parentItem,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<DragInfo>(
      builder: (BuildContext context, List<DragInfo?> accepted,
          List<dynamic> rejected) {
        return Watch(
          (context) {
            return AnimatedContainer(
              margin: DragAndDropStore.showDropTarget.value
                  ? const EdgeInsets.symmetric(
                      vertical: 4,
                    )
                  : EdgeInsets.zero,
              duration: const Duration(
                milliseconds: 100,
              ),
              curve: Curves.easeIn,
              height: DragAndDropStore.highlightId.value == highlightId
                  ? 80
                  : DragAndDropStore.showDropTarget.value
                      ? 30
                      : 0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: DragAndDropStore.highlightId.value == highlightId
                    ? rejected.isEmpty
                        ? Colors.grey.shade700
                        : Colors.red.shade900
                    : Colors.grey.shade400,
              ),
              child: AnimatedDefaultTextStyle(
                style: TextStyle(
                  fontSize: DragAndDropStore.highlightId.value == highlightId
                      ? 20
                      : 16,
                  color: DragAndDropStore.highlightId.value == highlightId
                      ? Colors.white
                      : Colors.white.withOpacity(0.8),
                ),
                duration: const Duration(
                  milliseconds: 250,
                ),
                child: rejected.isEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Drop',
                          ),
                          const Gap(10),
                          Icon(
                            DragAndDropStore.dropIcon.value,
                            color: DragAndDropStore.highlightId.value ==
                                    highlightId
                                ? Colors.white
                                : Colors.white.withOpacity(0.8),
                          ),
                          const Gap(8),
                          Text(
                            DragAndDropStore.dropTitle.value ?? '',
                          ),
                          const Gap(10),
                          const Text(
                            'here',
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Can\'t drop',
                          ),
                          const Gap(10),
                          Icon(
                            DragAndDropStore.dropIcon.value,
                            color: DragAndDropStore.highlightId.value ==
                                    highlightId
                                ? Colors.white
                                : Colors.white.withOpacity(0.8),
                          ),
                          const Gap(8),
                          Text(
                            DragAndDropStore.dropTitle.value ?? '',
                          ),
                          const Gap(10),
                          const Text(
                            'here',
                          ),
                        ],
                      ),
              ),
            );
          },
        );
      },
      onWillAcceptWithDetails: (details) {
        // return details.data.layoutType == ElementLayoutType.input;
        if (parentItem?.type == ElementType.grid &&
            details.data.type == ElementType.grid) {
          return false;
        }
        return true;
      },
      onAcceptWithDetails: (details) {
        DragAndDropStore.highlightId.value = '';
        onDrop?.call(
          ElementModel.fromDragInfo(
            details.data,
            parentItem: parentItem,
          ),
        );
      },
      onLeave: (data) {
        DragAndDropStore.highlightId.value = '';
      },
      onMove: (details) {
        DragAndDropStore.highlightId.value = highlightId;
      },
    );
  }
}
