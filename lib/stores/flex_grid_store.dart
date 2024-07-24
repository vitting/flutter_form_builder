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
}
