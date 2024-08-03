import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'element_config_model.g.dart';

@CopyWith()
@JsonSerializable()
class ElementConfigModel extends Equatable {
  final String? labelText;
  final bool? required;
  final int? minLength;
  final int? maxLength;
  final int? minValue;
  final int? maxValue;
  final bool? readOnly;
  final String? initialValue;
  final String? hintText;

  const ElementConfigModel({
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

  @override
  bool get stringify => true;

  factory ElementConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ElementConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$ElementConfigModelToJson(this);

  @override
  List<Object?> get props => [
        labelText,
        required,
        minLength,
        maxLength,
        minValue,
        maxValue,
        readOnly,
        initialValue,
        hintText,
      ];
}
