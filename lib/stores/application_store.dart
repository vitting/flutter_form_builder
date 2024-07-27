import 'package:flutter_web_formbuilder/enums/element_layout_type_enum.dart';
import 'package:flutter_web_formbuilder/enums/element_type_enum.dart';
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
    gridChildren: [
      [
        [
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
        ],
        [
          ElementModel(
            id: const Uuid().v4(),
            title: 'Number field',
            description: 'This is a number field',
            type: ElementType.number,
            layoutType: ElementLayoutType.input,
          ),
        ],
      ],
      [
        [
          ElementModel(
            id: const Uuid().v4(),
            title: 'Text field',
            description: 'This is a text field',
            type: ElementType.text,
            layoutType: ElementLayoutType.input,
          ),
        ],
        [
          ElementModel(
            id: const Uuid().v4(),
            title: 'Number field',
            description: 'This is a number field',
            type: ElementType.number,
            layoutType: ElementLayoutType.input,
          ),
        ],
      ],
    ],
  ),
  ElementModel(
    id: const Uuid().v4(),
    title: 'Grid layout',
    description: 'This is a grid layout',
    type: ElementType.grid,
    layoutType: ElementLayoutType.layout,
    gridChildren: [
      [
        [
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
        ],
        [
          ElementModel(
            id: const Uuid().v4(),
            title: 'Number field',
            description: 'This is a number field',
            type: ElementType.number,
            layoutType: ElementLayoutType.input,
          ),
        ],
      ],
      [
        [
          ElementModel(
            id: const Uuid().v4(),
            title: 'Text field',
            description: 'This is a text field',
            type: ElementType.text,
            layoutType: ElementLayoutType.input,
          ),
        ],
        [
          ElementModel(
            id: const Uuid().v4(),
            title: 'Number field',
            description: 'This is a number field',
            type: ElementType.number,
            layoutType: ElementLayoutType.input,
          ),
        ],
      ],
    ],
  ),
  ElementModel(
    id: const Uuid().v4(),
    title: 'Grid layout',
    description: 'This is a grid layout',
    type: ElementType.grid,
    layoutType: ElementLayoutType.layout,
    gridChildren: [
      [
        [
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
        ],
        [
          ElementModel(
            id: const Uuid().v4(),
            title: 'Number field',
            description: 'This is a number field',
            type: ElementType.number,
            layoutType: ElementLayoutType.input,
          ),
        ],
      ],
      [
        [
          ElementModel(
            id: const Uuid().v4(),
            title: 'Text field',
            description: 'This is a text field',
            type: ElementType.text,
            layoutType: ElementLayoutType.input,
          ),
        ],
        [
          ElementModel(
            id: const Uuid().v4(),
            title: 'Number field',
            description: 'This is a number field',
            type: ElementType.number,
            layoutType: ElementLayoutType.input,
          ),
        ],
      ],
    ],
  ),
  ElementModel(
    id: const Uuid().v4(),
    title: 'Grid layout',
    description: 'This is a grid layout',
    type: ElementType.grid,
    layoutType: ElementLayoutType.layout,
    gridChildren: [
      [
        [
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
        ],
        [
          ElementModel(
            id: const Uuid().v4(),
            title: 'Number field',
            description: 'This is a number field',
            type: ElementType.number,
            layoutType: ElementLayoutType.input,
          ),
        ],
      ],
      [
        [
          ElementModel(
            id: const Uuid().v4(),
            title: 'Text field',
            description: 'This is a text field',
            type: ElementType.text,
            layoutType: ElementLayoutType.input,
          ),
        ],
        [
          ElementModel(
            id: const Uuid().v4(),
            title: 'Number field',
            description: 'This is a number field',
            type: ElementType.number,
            layoutType: ElementLayoutType.input,
          ),
        ],
      ],
    ],
  ),
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
];

class ApplicationStore {
  static final items = listSignal<ElementModel>(dummy.toList());

  static void updateItem(ElementModel item) {
    final index = items.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      items[index] = item;
    }
  }
}
