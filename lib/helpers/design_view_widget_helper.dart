import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/widgets/inputs/input_number.dart';
import 'package:flutter_web_formbuilder/widgets/inputs/input_text.dart';
import 'package:flutter_web_formbuilder/widgets/layouts/flex_grid.dart';

class DesignViewWidgetHelper {
  static Widget getWidget(ElementModel item) {
    switch (item.type) {
      case ElementType.text:
        return InputText(
          labelText: item.title,
          readOnly: true,
        );
      case ElementType.number:
        return InputNumber(
          labelText: item.title,
          readOnly: true,
        );
      case ElementType.grid:
        return FlexGrid(
          columnCount: item.columnCount ?? 2,
          rowCount: item.rowCount ?? 2,
        );
      default:
        return InputText(
          labelText: item.title,
          readOnly: true,
        );
      // case ElementInputType.date:
      // // TODO: Handle this case.
      // case ElementInputType.email:
      // // TODO: Handle this case.
      // case ElementInputType.checkbox:
      // // TODO: Handle this case.
      // case ElementInputType.checkboxList:
      // // TODO: Handle this case.
    }
  }
}
