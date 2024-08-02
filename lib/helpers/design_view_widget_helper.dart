import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/enums/element_type_enum.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/widgets/inputs/input_dropdown.dart';
import 'package:flutter_web_formbuilder/widgets/inputs/input_number.dart';
import 'package:flutter_web_formbuilder/widgets/inputs/input_text.dart';
import 'package:flutter_web_formbuilder/widgets/layouts/flex_grid.dart';

class DesignViewWidgetHelper {
  static Widget getWidget(ElementModel item) {
    switch (item.type) {
      case ElementType.text:
        return InputText(
          labelText: item.config.labelText ?? '',
          readOnly: true,
        );
      case ElementType.number:
        return InputNumber(
          labelText: item.config.labelText ?? '',
          readOnly: true,
        );
      case ElementType.dropdown:
        return InputDropdown(
          labelText: item.config.labelText ?? '',
          readOnly: true,
        );
      case ElementType.grid:
        return FlexGrid(
          item: item,
        );
      default:
        return InputText(
          labelText: item.config.labelText ?? '',
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
