import 'package:flutter_web_formbuilder/models/element_model.dart';

class FlexGridStore {
  static ElementModel reorderGridChild(ElementModel item, int rowIndex,
      int columnIndex, int oldIndex, int newIndex) {
    final newItem = item.reorderGridChildAndGetCopyOf(
        item: item,
        rowIndex: rowIndex,
        columnIndex: columnIndex,
        oldIndex: oldIndex,
        newIndex: newIndex);

    return newItem;
  }

  static ElementModel addGridChildFirst({
    required ElementModel item,
    required int rowIndex,
    required int columnIndex,
    required ElementModel itemToAdd,
  }) {
    final newItem = item.addGridChildFirstAndGetCopyOf(
      item: itemToAdd,
      rowIndex: rowIndex,
      columnIndex: columnIndex,
    );

    return newItem;
  }

  static ElementModel addGridChildAtIndex({
    required ElementModel item,
    required int rowIndex,
    required int columnIndex,
    required ElementModel itemToAdd,
    required int gridChildIndex,
  }) {
    final newItem = item.addGridChildAtIndexAndGetCopyOf(
      item: itemToAdd,
      rowIndex: rowIndex,
      columnIndex: columnIndex,
      gridChildIndex: gridChildIndex,
    );

    return newItem;
  }

  static ElementModel removeGridChild({
    required ElementModel item,
    required int rowIndex,
    required int columnIndex,
    required ElementModel itemToRemove,
  }) {
    final newItem = item.removeGridChild(
      rowIndex: rowIndex,
      columnIndex: columnIndex,
      item: itemToRemove,
    );

    return newItem;
  }

  static ElementModel deleteGridRow({
    required ElementModel item,
    required int rowIndex,
  }) {
    return item.copyWith(
      rowCount: item.rowCount != null ? item.rowCount! - 1 : 0,
      gridChildren: {
        ...item.gridChildren,
      }..removeWhere(
          (key, value) => splitRowColumn(key).row == rowIndex,
        ),
    );
  }

  static ElementModel deleteGridColumn({
    required ElementModel item,
    required int columnIndex,
  }) {
    return item.copyWith(
      columnCount: item.columnCount != null ? item.columnCount! - 1 : 0,
      gridChildren: {
        ...item.gridChildren,
      }..removeWhere(
          (key, value) => splitRowColumn(key).column == columnIndex,
        ),
    );
  }

  static ({int row, int column}) splitRowColumn(String key) {
    final split = key.split(':');
    return (
      row: int.parse(split[0]),
      column: int.parse(split[1]),
    );
  }
}
