import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/stores/drag_and_drop_store.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';

class DropTargetZone extends StatelessWidget {
  final ValueChanged<ElementModel>? onDrop;
  final String highlightId;
  const DropTargetZone({
    super.key,
    this.onDrop,
    required this.highlightId,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<DragInfo>(
      builder: (BuildContext context, List<DragInfo?> accepted,
          List<dynamic> rejected) {
        debugPrint('accepted: $accepted');
        debugPrint('rejected: $rejected');
        return Watch(
          (context) => AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeIn,
            height: DragAndDropStore.highlightId.value == highlightId
                ? 80
                : DragAndDropStore.showDropTarget.value
                    ? 30
                    : 0,
            decoration: BoxDecoration(
              color: DragAndDropStore.highlightId.value == highlightId
                  ? Colors.blue.shade700
                  : Colors.blue.shade400,
            ),
            child: AnimatedDefaultTextStyle(
              style: TextStyle(
                fontSize:
                    DragAndDropStore.highlightId.value == highlightId ? 20 : 16,
                color: DragAndDropStore.highlightId.value == highlightId
                    ? Colors.white
                    : Colors.white.withOpacity(0.8),
              ),
              duration: const Duration(milliseconds: 250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Drop',
                  ),
                  const Gap(10),
                  Icon(
                    DragAndDropStore.dropIcon.value,
                    color: DragAndDropStore.highlightId.value == highlightId
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
          ),
        );
      },
      onWillAcceptWithDetails: (details) {
        debugPrint('onWillAcceptWithDetails: $details');
        return details.data.layoutType == ElementLayoutType.input;
      },
      onAcceptWithDetails: (details) {
        DragAndDropStore.highlightId.value = '';
        onDrop?.call(ElementModel.fromDragInfo(details.data));

        debugPrint('onAcceptWithDetails: $details');
      },
      onLeave: (data) {
        DragAndDropStore.highlightId.value = '';

        debugPrint('onLeave: $data');
      },
      onMove: (details) {
        DragAndDropStore.highlightId.value = highlightId;

        debugPrint('onMove: $details');
      },
    );
  }
}
