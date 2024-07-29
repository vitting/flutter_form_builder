import 'package:flutter_web_formbuilder/enums/element_layout_type_enum.dart';
import 'package:flutter_web_formbuilder/enums/element_type_enum.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:signals/signals.dart';
import 'package:uuid/uuid.dart';

final Iterable<ElementModel> dummy = [
  const ElementModel(
    id: 'c5729989-ccd0-4131-875d-199db4baa103',
    parentId: 'c5729989-ccd0-4131-875d-199db4baa103',
    title: 'Text field',
    description: 'This is a text field',
    type: ElementType.text,
    layoutType: ElementLayoutType.input,
  ),
  const ElementModel(
    id: '85d5ad65-69b5-4e49-8d1b-f7b08cb3cf72',
    parentId: '85d5ad65-69b5-4e49-8d1b-f7b08cb3cf72',
    title: 'Number field',
    description: 'This is a number field',
    type: ElementType.number,
    layoutType: ElementLayoutType.input,
  ),
  ElementModel(
    id: 'b695278a-e3f9-4294-a7e5-a002d9831d4f',
    parentId: 'b695278a-e3f9-4294-a7e5-a002d9831d4f',
    title: 'Grid layout',
    description: 'This is a grid layout',
    type: ElementType.grid,
    layoutType: ElementLayoutType.layout,
    gridChildren: [
      [
        [
          ElementModel(
            id: const Uuid().v4(),
            parentId: 'b695278a-e3f9-4294-a7e5-a002d9831d4f',
            title: 'Text field',
            description: 'This is a text field',
            type: ElementType.text,
            layoutType: ElementLayoutType.input,
          ),
          ElementModel(
            id: const Uuid().v4(),
            parentId: 'b695278a-e3f9-4294-a7e5-a002d9831d4f',
            title: 'Number field',
            description: 'This is a number field',
            type: ElementType.number,
            layoutType: ElementLayoutType.input,
          ),
        ],
        [
          ElementModel(
            id: const Uuid().v4(),
            parentId: 'b695278a-e3f9-4294-a7e5-a002d9831d4f',
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
            parentId: 'b695278a-e3f9-4294-a7e5-a002d9831d4f',
            title: 'Text field',
            description: 'This is a text field',
            type: ElementType.text,
            layoutType: ElementLayoutType.input,
          ),
        ],
        [
          ElementModel(
            id: const Uuid().v4(),
            parentId: 'b695278a-e3f9-4294-a7e5-a002d9831d4f',
            title: 'Number field',
            description: 'This is a number field',
            type: ElementType.number,
            layoutType: ElementLayoutType.input,
          ),
        ],
      ],
    ],
  ),
  const ElementModel(
    id: '3ca9406e-14f5-419c-94de-570979accc35',
    parentId: '3ca9406e-14f5-419c-94de-570979accc35',
    title: 'Text field',
    description: 'This is a text field',
    type: ElementType.text,
    layoutType: ElementLayoutType.input,
  ),
  const ElementModel(
    id: '273b92b2-3c19-4684-b0ea-e29e429e91fb',
    parentId: '273b92b2-3c19-4684-b0ea-e29e429e91fb',
    title: 'Number field',
    description: 'This is a number field',
    type: ElementType.number,
    layoutType: ElementLayoutType.input,
  ),
  const ElementModel(
    id: 'ba3fb01f-8fd3-4c0e-b713-c3d4b62597c4',
    parentId: 'ba3fb01f-8fd3-4c0e-b713-c3d4b62597c4',
    title: 'Text field',
    description: 'This is a text field',
    type: ElementType.text,
    layoutType: ElementLayoutType.input,
  ),
  const ElementModel(
    id: '54ae9b82-f96e-4aa9-9132-eb5882f15771',
    parentId: '54ae9b82-f96e-4aa9-9132-eb5882f15771',
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
