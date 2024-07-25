import 'package:flutter_web_formbuilder/enums/element_layout_type_enum.dart';
import 'package:flutter_web_formbuilder/enums/element_type_enum.dart';
import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'element_model.freezed.dart';

// part 'element_model.g.dart';

@freezed
class ElementModel with _$ElementModel {
  const ElementModel._();

  const factory ElementModel({
    required String id,
    String? title,
    String? description,
    required ElementType type,
    required ElementLayoutType layoutType,
    @Default([]) List<List<List<ElementModel>>> gridChildren,
    int? columnCount,
    int? rowCount,
  }) = _ElementModel;

  List<List<ElementModel>> getRow(int rowIndex) {
    return gridChildren[rowIndex];
  }

  ElementModel deleteRow(int rowIndex) {
    final newGridChildren = [...gridChildren];
    newGridChildren.removeAt(rowIndex);
    return copyWith(gridChildren: newGridChildren);
  }

  List<ElementModel> getColumn(int rowIndex, int columnIndex) {
    return gridChildren[rowIndex][columnIndex];
  }

  ElementModel deleteColumn(int rowIndex, int columnIndex) {
    final newGridChildren = [...gridChildren];
    final newColumns = [...getRow(rowIndex)];
    newColumns.removeAt(columnIndex);
    newGridChildren[rowIndex] = newColumns;
    return copyWith(gridChildren: newGridChildren);
  }

  ElementModel addGridChildFirstAndGetCopyOf({
    required ElementModel itemToInsert,
    required int rowIndex,
    required int columnIndex,
  }) {
    final newGridChildren2 = [...gridChildren];
    final newColumn = [...getColumn(rowIndex, columnIndex)];
    newColumn.insert(0, itemToInsert);
    newGridChildren2[rowIndex][columnIndex] = newColumn;

    return copyWith(gridChildren: newGridChildren2);
  }

  ElementModel addGridChildAtIndexAndGetCopyOf({
    required ElementModel itemToInsert,
    required int rowIndex,
    required int columnIndex,
    required int gridChildIndex,
  }) {
    final newGridChildren = [...gridChildren];
    final newColumn = [...getColumn(rowIndex, columnIndex)];

    newColumn.insert(gridChildIndex + 1, itemToInsert);
    newGridChildren[rowIndex][columnIndex] = newColumn;

    return copyWith(gridChildren: newGridChildren);
  }

  ElementModel removeGridChildAndGetCopyOf({
    required int rowIndex,
    required int columnIndex,
    required ElementModel itemToRemove,
  }) {
    final newGridChildren = [...gridChildren];
    final newColumn = [...getColumn(rowIndex, columnIndex)];
    newColumn.removeWhere((element) => element.id == itemToRemove.id);
    newGridChildren[rowIndex][columnIndex] = newColumn;

    return copyWith(gridChildren: newGridChildren);
  }

  ElementModel reorderGridChildAndGetCopyOf({
    required int rowIndex,
    required int columnIndex,
    required int oldIndex,
    required int newIndex,
  }) {
    final newGridChildren = [...gridChildren];
    final newColumn = getColumn(rowIndex, columnIndex);
    final item = newColumn.removeAt(oldIndex);
    newColumn.insert(newIndex, item);

    return copyWith(gridChildren: newGridChildren);
  }

  static ElementModel fromDragInfo(DragInfo dragInfo) {
    return ElementModel(
      title: dragInfo.title,
      description: dragInfo.description,
      layoutType: dragInfo.layoutType,
      type: dragInfo.type,
      id: const Uuid().v4(),
      rowCount: dragInfo.type == ElementType.grid ? 1 : null,
      columnCount: dragInfo.type == ElementType.grid ? 2 : null,
    );
  }
}
