// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'definition_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DefinitionModelCWProxy {
  DefinitionModel id(String id);

  DefinitionModel title(String title);

  DefinitionModel description(String description);

  DefinitionModel layoutType(ElementLayoutType layoutType);

  DefinitionModel type(ElementType type);

  DefinitionModel iconName(String iconName);

  DefinitionModel config(ElementConfigModel config);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DefinitionModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DefinitionModel(...).copyWith(id: 12, name: "My name")
  /// ````
  DefinitionModel call({
    String? id,
    String? title,
    String? description,
    ElementLayoutType? layoutType,
    ElementType? type,
    String? iconName,
    ElementConfigModel? config,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDefinitionModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDefinitionModel.copyWith.fieldName(...)`
class _$DefinitionModelCWProxyImpl implements _$DefinitionModelCWProxy {
  const _$DefinitionModelCWProxyImpl(this._value);

  final DefinitionModel _value;

  @override
  DefinitionModel id(String id) => this(id: id);

  @override
  DefinitionModel title(String title) => this(title: title);

  @override
  DefinitionModel description(String description) =>
      this(description: description);

  @override
  DefinitionModel layoutType(ElementLayoutType layoutType) =>
      this(layoutType: layoutType);

  @override
  DefinitionModel type(ElementType type) => this(type: type);

  @override
  DefinitionModel iconName(String iconName) => this(iconName: iconName);

  @override
  DefinitionModel config(ElementConfigModel config) => this(config: config);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DefinitionModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DefinitionModel(...).copyWith(id: 12, name: "My name")
  /// ````
  DefinitionModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? layoutType = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? iconName = const $CopyWithPlaceholder(),
    Object? config = const $CopyWithPlaceholder(),
  }) {
    return DefinitionModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      layoutType:
          layoutType == const $CopyWithPlaceholder() || layoutType == null
              ? _value.layoutType
              // ignore: cast_nullable_to_non_nullable
              : layoutType as ElementLayoutType,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as ElementType,
      iconName: iconName == const $CopyWithPlaceholder() || iconName == null
          ? _value.iconName
          // ignore: cast_nullable_to_non_nullable
          : iconName as String,
      config: config == const $CopyWithPlaceholder() || config == null
          ? _value.config
          // ignore: cast_nullable_to_non_nullable
          : config as ElementConfigModel,
    );
  }
}

extension $DefinitionModelCopyWith on DefinitionModel {
  /// Returns a callable class that can be used as follows: `instanceOfDefinitionModel.copyWith(...)` or like so:`instanceOfDefinitionModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DefinitionModelCWProxy get copyWith => _$DefinitionModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefinitionModel _$DefinitionModelFromJson(Map<String, dynamic> json) =>
    DefinitionModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      layoutType: $enumDecode(_$ElementLayoutTypeEnumMap, json['layoutType']),
      type: $enumDecode(_$ElementTypeEnumMap, json['type']),
      iconName: json['iconName'] as String,
      config:
          ElementConfigModel.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DefinitionModelToJson(DefinitionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'layoutType': _$ElementLayoutTypeEnumMap[instance.layoutType]!,
      'type': _$ElementTypeEnumMap[instance.type]!,
      'config': instance.config.toJson(),
      'iconName': instance.iconName,
    };

const _$ElementLayoutTypeEnumMap = {
  ElementLayoutType.input: 'input',
  ElementLayoutType.layout: 'layout',
};

const _$ElementTypeEnumMap = {
  ElementType.text: 'text',
  ElementType.number: 'number',
  ElementType.date: 'date',
  ElementType.email: 'email',
  ElementType.checkbox: 'checkbox',
  ElementType.checkboxList: 'checkboxList',
  ElementType.dropdown: 'dropdown',
  ElementType.grid: 'grid',
};
