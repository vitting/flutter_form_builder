import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_web_formbuilder/enums/element_layout_type_enum.dart';
import 'package:flutter_web_formbuilder/enums/element_type_enum.dart';
import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:uuid/uuid.dart';

part 'element_model.g.dart';

@CopyWith()
class ElementModel extends Equatable {
  final String id;
  final String? title;
  final String? description;
  final ElementType type;
  final ElementLayoutType layoutType;
  final List<List<List<ElementModel>>> gridChildren;
  final int? columnCount;
  final int? rowCount;

  const ElementModel({
    required this.id,
    this.title,
    this.description,
    required this.type,
    required this.layoutType,
    this.gridChildren = const [],
    this.columnCount,
    this.rowCount,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        type,
        layoutType,
        gridChildren,
        columnCount,
        rowCount,
      ];

  @override
  bool get stringify => true;

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

  static List<List<List<ElementModel>>> generateGridChild({
    required int rowCount,
    required int columnCount,
  }) {
    return List.generate(
      rowCount,
      (rowIndex) => List.generate(
        columnCount,
        (columnIndex) => [],
      ),
    );
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
      gridChildren: dragInfo.type == ElementType.grid
          ? ElementModel.generateGridChild(
              rowCount: 1,
              columnCount: 2,
            )
          : [],
    );
  }
}
