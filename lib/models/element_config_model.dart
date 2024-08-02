import 'package:copy_with_extension/copy_with_extension.dart';

part 'element_config_model.g.dart';

@CopyWith()
class ElementConfigModel {
  final String? labelText;
  final bool? required;
  final int? minLength;
  final int? maxLength;
  final int? minValue;
  final int? maxValue;
  final bool? readOnly;
  final String? initialValue;
  final String? hintText;

  ElementConfigModel({
    this.labelText,
    this.required,
    this.minLength,
    this.maxLength,
    this.minValue,
    this.maxValue,
    this.readOnly,
    this.initialValue,
    this.hintText,
  });
}
