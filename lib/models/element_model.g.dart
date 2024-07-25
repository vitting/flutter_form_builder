// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ElementModelCWProxy {
  ElementModel id(String id);

  ElementModel title(String? title);

  ElementModel description(String? description);

  ElementModel type(ElementType type);

  ElementModel layoutType(ElementLayoutType layoutType);

  ElementModel gridChildren2(List<List<List<ElementModel>>> gridChildren2);

  ElementModel columnCount(int? columnCount);

  ElementModel rowCount(int? rowCount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ElementModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ElementModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ElementModel call({
    String? id,
    String? title,
    String? description,
    ElementType? type,
    ElementLayoutType? layoutType,
    List<List<List<ElementModel>>>? gridChildren2,
    int? columnCount,
    int? rowCount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfElementModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfElementModel.copyWith.fieldName(...)`
class _$ElementModelCWProxyImpl implements _$ElementModelCWProxy {
  const _$ElementModelCWProxyImpl(this._value);

  final ElementModel _value;

  @override
  ElementModel id(String id) => this(id: id);

  @override
  ElementModel title(String? title) => this(title: title);

  @override
  ElementModel description(String? description) =>
      this(description: description);

  @override
  ElementModel type(ElementType type) => this(type: type);

  @override
  ElementModel layoutType(ElementLayoutType layoutType) =>
      this(layoutType: layoutType);

  @override
  ElementModel gridChildren2(List<List<List<ElementModel>>> gridChildren2) =>
      this(gridChildren2: gridChildren2);

  @override
  ElementModel columnCount(int? columnCount) => this(columnCount: columnCount);

  @override
  ElementModel rowCount(int? rowCount) => this(rowCount: rowCount);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ElementModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ElementModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ElementModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? layoutType = const $CopyWithPlaceholder(),
    Object? gridChildren2 = const $CopyWithPlaceholder(),
    Object? columnCount = const $CopyWithPlaceholder(),
    Object? rowCount = const $CopyWithPlaceholder(),
  }) {
    return ElementModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
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
          gridChildren2 == const $CopyWithPlaceholder() || gridChildren2 == null
              ? _value.gridChildren
              // ignore: cast_nullable_to_non_nullable
              : gridChildren2 as List<List<List<ElementModel>>>,
      columnCount: columnCount == const $CopyWithPlaceholder()
          ? _value.columnCount
          // ignore: cast_nullable_to_non_nullable
          : columnCount as int?,
      rowCount: rowCount == const $CopyWithPlaceholder()
          ? _value.rowCount
          // ignore: cast_nullable_to_non_nullable
          : rowCount as int?,
    );
  }
}

extension $ElementModelCopyWith on ElementModel {
  /// Returns a callable class that can be used as follows: `instanceOfElementModel.copyWith(...)` or like so:`instanceOfElementModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ElementModelCWProxy get copyWith => _$ElementModelCWProxyImpl(this);
}
