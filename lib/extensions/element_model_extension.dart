import 'package:flutter_web_formbuilder/models/element_model.dart';

extension GridChildrenExtension on ElementModel {
  // Get the number of rows in the grid
  int getGridChildRowCount() {
    return gridChildren.length;
  }

  // Get the number of columns in a specific row in the grid
  int getGridChildColumnsCount(int rowIndex) {
    return gridChildren[rowIndex].length;
  }

  // Get the content of a specific row in the grid
  List<List<ElementModel>> getGridChildRow(int rowIndex) {
    return gridChildren[rowIndex];
  }

  // Get the content of a specific cell in the grid
  List<ElementModel> getGridChildColumn(int rowIndex, int columnIndex) {
    return gridChildren[rowIndex][columnIndex];
  }

  ElementModel reorderGridChild(
      int rowIndex, int columnIndex, int oldIndex, int newIndex) {
    final newGridChildren = [...gridChildren];
    final newColumn = getGridChildColumn(rowIndex, columnIndex);
    final item = newColumn.removeAt(oldIndex);
    newColumn.insert(newIndex, item);

    return copyWith(gridChildren: newGridChildren);
  }

  ElementModel addGridChildFirst({
    required int rowIndex,
    required int columnIndex,
    required ElementModel itemToAdd,
  }) {
    final newGridChildren = [...gridChildren];
    final newColumn = [...getGridChildColumn(rowIndex, columnIndex)];
    newColumn.insert(0, itemToAdd);
    newGridChildren[rowIndex][columnIndex] = newColumn;

    return copyWith(gridChildren: newGridChildren);
  }

  ElementModel addGridChildAtIndex({
    required int rowIndex,
    required int columnIndex,
    required ElementModel itemToAdd,
    required int gridChildIndex,
  }) {
    final newGridChildren = [...gridChildren];
    final newColumn = [...getGridChildColumn(rowIndex, columnIndex)];

    newColumn.insert(gridChildIndex + 1, itemToAdd);
    newGridChildren[rowIndex][columnIndex] = newColumn;

    return copyWith(gridChildren: newGridChildren);
  }

  ElementModel removeGridChild({
    required int rowIndex,
    required int columnIndex,
    required ElementModel itemToRemove,
  }) {
    final newGridChildren = [...gridChildren];
    final newColumn = [...getGridChildColumn(rowIndex, columnIndex)];
    newColumn.removeWhere((element) => element.id == itemToRemove.id);
    newGridChildren[rowIndex][columnIndex] = newColumn;

    return copyWith(gridChildren: newGridChildren);
  }

  ElementModel deleteGridRow({
    required int rowIndex,
  }) {
    final newGridChildren = [...gridChildren];
    newGridChildren.removeAt(rowIndex);
    return copyWith(gridChildren: newGridChildren);
  }

  ElementModel deleteGridColumn({
    required int rowIndex,
    required int columnIndex,
  }) {
    final newGridChildren = [...gridChildren];
    final newColumns = [...getGridChildRow(rowIndex)];
    newColumns.removeAt(columnIndex);
    newGridChildren[rowIndex] = newColumns;
    return copyWith(gridChildren: newGridChildren);
  }
}
