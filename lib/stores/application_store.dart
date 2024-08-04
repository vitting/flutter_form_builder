import 'package:flutter_web_formbuilder/enums/element_layout_type_enum.dart';
import 'package:flutter_web_formbuilder/enums/element_type_enum.dart';
import 'package:flutter_web_formbuilder/models/element_config_model.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:signals/signals.dart';
import 'package:uuid/uuid.dart';

final Iterable<ElementModel> dummy = [
  const ElementModel(
    id: 'c59d7d76-501d-424e-a341-8d31325239bb',
    parentId: 'c59d7d76-501d-424e-a341-8d31325239bb',
    config: ElementConfigModel(
      labelText: 'Dropdown field',
      hintText: '',
      initialValue: '',
    ),
    description: 'This is a Dropdown field',
    type: ElementType.dropdown,
    layoutType: ElementLayoutType.input,
  ),
  const ElementModel(
    id: 'c5729989-ccd0-4131-875d-199db4baa103',
    parentId: 'c5729989-ccd0-4131-875d-199db4baa103',
    config: ElementConfigModel(
      labelText: 'Text field',
      hintText: '',
      initialValue: '',
      minLength: 0,
      maxLength: 0,
    ),
    description: 'This is a text field',
    type: ElementType.text,
    layoutType: ElementLayoutType.input,
  ),
  const ElementModel(
    id: '85d5ad65-69b5-4e49-8d1b-f7b08cb3cf72',
    parentId: '85d5ad65-69b5-4e49-8d1b-f7b08cb3cf72',
    config: ElementConfigModel(
      labelText: 'Number field',
      hintText: '',
      initialValue: '',
      minValue: 0,
      maxValue: 0,
    ),
    description: 'This is a number field',
    type: ElementType.number,
    layoutType: ElementLayoutType.input,
  ),
  ElementModel(
    id: 'b695278a-e3f9-4294-a7e5-a002d9831d4f',
    parentId: 'b695278a-e3f9-4294-a7e5-a002d9831d4f',
    config: const ElementConfigModel(
      labelText: 'Grid layout',
    ),
    description: 'This is a grid layout',
    type: ElementType.grid,
    layoutType: ElementLayoutType.layout,
    gridChildren: [
      [
        [
          ElementModel(
            id: const Uuid().v4(),
            parentId: 'b695278a-e3f9-4294-a7e5-a002d9831d4f',
            config: const ElementConfigModel(
              labelText: 'Text field',
              hintText: '',
              initialValue: '',
              minLength: 0,
              maxLength: 0,
            ),
            description: 'This is a text field',
            type: ElementType.text,
            layoutType: ElementLayoutType.input,
          ),
          ElementModel(
            id: const Uuid().v4(),
            parentId: 'b695278a-e3f9-4294-a7e5-a002d9831d4f',
            config: const ElementConfigModel(
              labelText: 'Number field',
              hintText: '',
              initialValue: '',
              minValue: 0,
              maxValue: 0,
            ),
            description: 'This is a number field',
            type: ElementType.number,
            layoutType: ElementLayoutType.input,
          ),
        ],
        [
          ElementModel(
            id: const Uuid().v4(),
            parentId: 'b695278a-e3f9-4294-a7e5-a002d9831d4f',
            config: const ElementConfigModel(
              labelText: 'Number field',
              hintText: '',
              initialValue: '',
              minValue: 0,
              maxValue: 0,
            ),
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
            parentId: 'b695278a-e3f9-4294-a7e5-a002d9831d4f',
            config: const ElementConfigModel(
              labelText: 'Text field',
              hintText: '',
              initialValue: '',
              minLength: 0,
              maxLength: 0,
            ),
            description: 'This is a text field',
            type: ElementType.text,
            layoutType: ElementLayoutType.input,
          ),
        ],
        [
          ElementModel(
            id: const Uuid().v4(),
            parentId: 'b695278a-e3f9-4294-a7e5-a002d9831d4f',
            config: const ElementConfigModel(
              labelText: 'Number field',
              hintText: '',
              initialValue: '',
              minValue: 0,
              maxValue: 0,
            ),
            description: 'This is a number field',
            type: ElementType.number,
            layoutType: ElementLayoutType.input,
          ),
        ],
      ],
    ],
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
