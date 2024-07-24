import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:signals/signals.dart';
import 'package:uuid/uuid.dart';

final Iterable<ElementModel> dummy = [
  ElementModel(
    id: const Uuid().v4(),
    title: 'Text field',
    description: 'This is a text field',
    type: ElementType.text,
    layoutType: ElementLayoutType.input,
  ),
  ElementModel(
    id: const Uuid().v4(),
    title: 'Number field',
    description: 'This is a number field',
    type: ElementType.number,
    layoutType: ElementLayoutType.input,
  ),
  ElementModel(
    id: const Uuid().v4(),
    title: 'Grid layout',
    description: 'This is a grid layout',
    type: ElementType.grid,
    layoutType: ElementLayoutType.layout,
    columnCount: 2,
    rowCount: 2,
    gridChildren: {
      ElementModel.generateGridMapKey(0, 0): [
        ElementModel(
          id: const Uuid().v4(),
          title: 'Text field',
          description: 'This is a text field',
          type: ElementType.text,
          layoutType: ElementLayoutType.input,
        ),
      ],
      ElementModel.generateGridMapKey(0, 1): [
        ElementModel(
          id: const Uuid().v4(),
          title: 'Number field',
          description: 'This is a number field',
          type: ElementType.number,
          layoutType: ElementLayoutType.input,
        ),
      ],
      ElementModel.generateGridMapKey(1, 0): [
        ElementModel(
          id: const Uuid().v4(),
          title: 'Text field',
          description: 'This is a text field',
          type: ElementType.text,
          layoutType: ElementLayoutType.input,
        ),
      ],
      ElementModel.generateGridMapKey(1, 1): [
        ElementModel(
          id: const Uuid().v4(),
          title: 'Number field',
          description: 'This is a number field',
          type: ElementType.number,
          layoutType: ElementLayoutType.input,
        ),
      ],
    },
  ),
];

class ApplicationStore {
  static final items = listSignal<ElementModel>(dummy.toList());

  static void updateItem(ElementModel item) {
    final index = items.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      items[index] = item;
    }
  }

  static void reorderGridChild(ElementModel item, int rowIndex, int columnIndex,
      int oldIndex, int newIndex) {
    final newItem = item.reorderGridChildAndGetCopyOf(
        item: item,
        rowIndex: rowIndex,
        columnIndex: columnIndex,
        oldIndex: oldIndex,
        newIndex: newIndex);

    updateItem(newItem);
  }
}
