import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'element_model.freezed.dart';

enum ElementType {
  text,
  number,
  date,
  email,
  checkbox,
  checkboxList,
  grid,
}

enum ElementLayoutType {
  input,
  layout,
}

@freezed
class ElementModel with _$ElementModel {
  const ElementModel._();
  const factory ElementModel({
    required String id,
    String? title,
    String? description,
    required ElementType type,
    required ElementLayoutType layoutType,
    @Default([]) List<ElementModel> children,
    @Default({}) Map<String, List<ElementModel>> gridChildren,
    int? columnCount,
    int? rowCount,
  }) = _ElementModel;

  List<ElementModel> getGridChildren(int rowIndex, int columnIndex) {
    return gridChildren[ElementModel.generateGridMapKey(
          rowIndex,
          columnIndex,
        )] ??
        [];
  }

  ElementModel addGridChildFirstAndGetCopyOf({
    required ElementModel item,
    required int rowIndex,
    required int columnIndex,
  }) {
    final newItem = copyWith(
      gridChildren: {
        ...gridChildren,
        ElementModel.generateGridMapKey(rowIndex, columnIndex): [
          item,
          ...getGridChildren(rowIndex, columnIndex),
        ],
      },
    );

    return newItem;
  }

  ElementModel addGridChildAtIndexAndGetCopyOf({
    required ElementModel item,
    required int rowIndex,
    required int columnIndex,
    required int gridChildIndex,
  }) {
    final children = getGridChildren(rowIndex, columnIndex);
    children.insert(gridChildIndex + 1, item);
    final newItem = copyWith(
      gridChildren: {
        ...gridChildren,
        ElementModel.generateGridMapKey(rowIndex, columnIndex): [
          ...children,
        ],
      },
    );

    return newItem;
  }

  static ElementModel fromDragInfo(DragInfo dragInfo) {
    return ElementModel(
      title: dragInfo.title,
      description: dragInfo.description,
      layoutType: dragInfo.layoutType,
      type: dragInfo.type,
      id: const Uuid().v4(),
    );
  }

  static String generateGridMapKey(int rowIndex, int columnIndex) {
    return '$rowIndex:$columnIndex';
  }
}
