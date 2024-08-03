// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ElementModelCWProxy {
  ElementModel id(String id);

  ElementModel parentId(String parentId);

  ElementModel description(String? description);

  ElementModel type(ElementType type);

  ElementModel layoutType(ElementLayoutType layoutType);

  ElementModel gridChildren(List<List<List<ElementModel>>> gridChildren);

  ElementModel config(ElementConfigModel config);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ElementModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ElementModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ElementModel call({
    String? id,
    String? parentId,
    String? description,
    ElementType? type,
    ElementLayoutType? layoutType,
    List<List<List<ElementModel>>>? gridChildren,
    ElementConfigModel? config,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfElementModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfElementModel.copyWith.fieldName(...)`
class _$ElementModelCWProxyImpl implements _$ElementModelCWProxy {
  const _$ElementModelCWProxyImpl(this._value);

  final ElementModel _value;

  @override
  ElementModel id(String id) => this(id: id);

  @override
  ElementModel parentId(String parentId) => this(parentId: parentId);

  @override
  ElementModel description(String? description) =>
      this(description: description);

  @override
  ElementModel type(ElementType type) => this(type: type);

  @override
  ElementModel layoutType(ElementLayoutType layoutType) =>
      this(layoutType: layoutType);

  @override
  ElementModel gridChildren(List<List<List<ElementModel>>> gridChildren) =>
      this(gridChildren: gridChildren);

  @override
  ElementModel config(ElementConfigModel config) => this(config: config);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ElementModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ElementModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ElementModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? parentId = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? layoutType = const $CopyWithPlaceholder(),
    Object? gridChildren = const $CopyWithPlaceholder(),
    Object? config = const $CopyWithPlaceholder(),
  }) {
    return ElementModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      parentId: parentId == const $CopyWithPlaceholder() || parentId == null
          ? _value.parentId
          // ignore: cast_nullable_to_non_nullable
          : parentId as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as ElementType,
      layoutType:
          layoutType == const $CopyWithPlaceholder() || layoutType == null
              ? _value.layoutType
              // ignore: cast_nullable_to_non_nullable
              : layoutType as ElementLayoutType,
      gridChildren:
          gridChildren == const $CopyWithPlaceholder() || gridChildren == null
              ? _value.gridChildren
              // ignore: cast_nullable_to_non_nullable
              : gridChildren as List<List<List<ElementModel>>>,
      config: config == const $CopyWithPlaceholder() || config == null
          ? _value.config
          // ignore: cast_nullable_to_non_nullable
          : config as ElementConfigModel,
    );
  }
}

extension $ElementModelCopyWith on ElementModel {
  /// Returns a callable class that can be used as follows: `instanceOfElementModel.copyWith(...)` or like so:`instanceOfElementModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ElementModelCWProxy get copyWith => _$ElementModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElementModel _$ElementModelFromJson(Map<String, dynamic> json) => ElementModel(
      id: json['id'] as String,
      parentId: json['parentId'] as String,
      description: json['description'] as String?,
      type: $enumDecode(_$ElementTypeEnumMap, json['type']),
      layoutType: $enumDecode(_$ElementLayoutTypeEnumMap, json['layoutType']),
      gridChildren: (json['gridChildren'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) => (e as List<dynamic>)
                      .map((e) =>
                          ElementModel.fromJson(e as Map<String, dynamic>))
                      .toList())
                  .toList())
              .toList() ??
          const [],
      config:
          ElementConfigModel.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ElementModelToJson(ElementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'description': instance.description,
      'type': _$ElementTypeEnumMap[instance.type]!,
      'layoutType': _$ElementLayoutTypeEnumMap[instance.layoutType]!,
      'gridChildren': instance.gridChildren
          .map((e) => e.map((e) => e.map((e) => e.toJson()).toList()).toList())
          .toList(),
      'config': instance.config.toJson(),
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

const _$ElementLayoutTypeEnumMap = {
  ElementLayoutType.input: 'input',
  ElementLayoutType.layout: 'layout',
};
