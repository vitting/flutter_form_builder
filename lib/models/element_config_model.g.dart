// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_config_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ElementConfigModelCWProxy {
  ElementConfigModel labelText(String? labelText);

  ElementConfigModel required(bool? required);

  ElementConfigModel minLength(int? minLength);

  ElementConfigModel maxLength(int? maxLength);

  ElementConfigModel minValue(int? minValue);

  ElementConfigModel maxValue(int? maxValue);

  ElementConfigModel readOnly(bool? readOnly);

  ElementConfigModel initialValue(String? initialValue);

  ElementConfigModel hintText(String? hintText);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ElementConfigModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ElementConfigModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ElementConfigModel call({
    String? labelText,
    bool? required,
    int? minLength,
    int? maxLength,
    int? minValue,
    int? maxValue,
    bool? readOnly,
    String? initialValue,
    String? hintText,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfElementConfigModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfElementConfigModel.copyWith.fieldName(...)`
class _$ElementConfigModelCWProxyImpl implements _$ElementConfigModelCWProxy {
  const _$ElementConfigModelCWProxyImpl(this._value);

  final ElementConfigModel _value;

  @override
  ElementConfigModel labelText(String? labelText) => this(labelText: labelText);

  @override
  ElementConfigModel required(bool? required) => this(required: required);

  @override
  ElementConfigModel minLength(int? minLength) => this(minLength: minLength);

  @override
  ElementConfigModel maxLength(int? maxLength) => this(maxLength: maxLength);

  @override
  ElementConfigModel minValue(int? minValue) => this(minValue: minValue);

  @override
  ElementConfigModel maxValue(int? maxValue) => this(maxValue: maxValue);

  @override
  ElementConfigModel readOnly(bool? readOnly) => this(readOnly: readOnly);

  @override
  ElementConfigModel initialValue(String? initialValue) =>
      this(initialValue: initialValue);

  @override
  ElementConfigModel hintText(String? hintText) => this(hintText: hintText);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ElementConfigModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ElementConfigModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ElementConfigModel call({
    Object? labelText = const $CopyWithPlaceholder(),
    Object? required = const $CopyWithPlaceholder(),
    Object? minLength = const $CopyWithPlaceholder(),
    Object? maxLength = const $CopyWithPlaceholder(),
    Object? minValue = const $CopyWithPlaceholder(),
    Object? maxValue = const $CopyWithPlaceholder(),
    Object? readOnly = const $CopyWithPlaceholder(),
    Object? initialValue = const $CopyWithPlaceholder(),
    Object? hintText = const $CopyWithPlaceholder(),
  }) {
    return ElementConfigModel(
      labelText: labelText == const $CopyWithPlaceholder()
          ? _value.labelText
          // ignore: cast_nullable_to_non_nullable
          : labelText as String?,
      required: required == const $CopyWithPlaceholder()
          ? _value.required
          // ignore: cast_nullable_to_non_nullable
          : required as bool?,
      minLength: minLength == const $CopyWithPlaceholder()
          ? _value.minLength
          // ignore: cast_nullable_to_non_nullable
          : minLength as int?,
      maxLength: maxLength == const $CopyWithPlaceholder()
          ? _value.maxLength
          // ignore: cast_nullable_to_non_nullable
          : maxLength as int?,
      minValue: minValue == const $CopyWithPlaceholder()
          ? _value.minValue
          // ignore: cast_nullable_to_non_nullable
          : minValue as int?,
      maxValue: maxValue == const $CopyWithPlaceholder()
          ? _value.maxValue
          // ignore: cast_nullable_to_non_nullable
          : maxValue as int?,
      readOnly: readOnly == const $CopyWithPlaceholder()
          ? _value.readOnly
          // ignore: cast_nullable_to_non_nullable
          : readOnly as bool?,
      initialValue: initialValue == const $CopyWithPlaceholder()
          ? _value.initialValue
          // ignore: cast_nullable_to_non_nullable
          : initialValue as String?,
      hintText: hintText == const $CopyWithPlaceholder()
          ? _value.hintText
          // ignore: cast_nullable_to_non_nullable
          : hintText as String?,
    );
  }
}

extension $ElementConfigModelCopyWith on ElementConfigModel {
  /// Returns a callable class that can be used as follows: `instanceOfElementConfigModel.copyWith(...)` or like so:`instanceOfElementConfigModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ElementConfigModelCWProxy get copyWith =>
      _$ElementConfigModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElementConfigModel _$ElementConfigModelFromJson(Map<String, dynamic> json) =>
    ElementConfigModel(
      labelText: json['labelText'] as String?,
      required: json['required'] as bool?,
      minLength: (json['minLength'] as num?)?.toInt(),
      maxLength: (json['maxLength'] as num?)?.toInt(),
      minValue: (json['minValue'] as num?)?.toInt(),
      maxValue: (json['maxValue'] as num?)?.toInt(),
      readOnly: json['readOnly'] as bool?,
      initialValue: json['initialValue'] as String?,
      hintText: json['hintText'] as String?,
    );

Map<String, dynamic> _$ElementConfigModelToJson(ElementConfigModel instance) =>
    <String, dynamic>{
      'labelText': instance.labelText,
      'required': instance.required,
      'minLength': instance.minLength,
      'maxLength': instance.maxLength,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
      'readOnly': instance.readOnly,
      'initialValue': instance.initialValue,
      'hintText': instance.hintText,
    };
