import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/widgets/inputs/input_number.dart';
import 'package:flutter_web_formbuilder/widgets/inputs/input_text.dart';

class DesignViewWidgetHelper {
  static Widget getInputWidget(ElementType? inputType, String labelText) {
    switch (inputType) {
      case ElementType.text:
        return InputText(
          labelText: labelText,
          readOnly: true,
        );
      case ElementType.number:
        return InputNumber(
          labelText: labelText,
          readOnly: true,
        );
      default:
        return InputText(
          labelText: labelText,
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
