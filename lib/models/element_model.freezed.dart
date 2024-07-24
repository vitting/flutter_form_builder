// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'element_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ElementModel {
  String get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  ElementType get type => throw _privateConstructorUsedError;
  ElementLayoutType get layoutType => throw _privateConstructorUsedError;
  List<ElementModel> get children => throw _privateConstructorUsedError;
  Map<String, List<ElementModel>> get gridChildren =>
      throw _privateConstructorUsedError;
  int? get columnCount => throw _privateConstructorUsedError;
  int? get rowCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ElementModelCopyWith<ElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElementModelCopyWith<$Res> {
  factory $ElementModelCopyWith(
          ElementModel value, $Res Function(ElementModel) then) =
      _$ElementModelCopyWithImpl<$Res, ElementModel>;
  @useResult
  $Res call(
      {String id,
      String? title,
      String? description,
      ElementType type,
      ElementLayoutType layoutType,
      List<ElementModel> children,
      Map<String, List<ElementModel>> gridChildren,
      int? columnCount,
      int? rowCount});
}

/// @nodoc
class _$ElementModelCopyWithImpl<$Res, $Val extends ElementModel>
    implements $ElementModelCopyWith<$Res> {
  _$ElementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? type = null,
    Object? layoutType = null,
    Object? children = null,
    Object? gridChildren = null,
    Object? columnCount = freezed,
    Object? rowCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ElementType,
      layoutType: null == layoutType
          ? _value.layoutType
          : layoutType // ignore: cast_nullable_to_non_nullable
              as ElementLayoutType,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ElementModel>,
      gridChildren: null == gridChildren
          ? _value.gridChildren
          : gridChildren // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ElementModel>>,
      columnCount: freezed == columnCount
          ? _value.columnCount
          : columnCount // ignore: cast_nullable_to_non_nullable
              as int?,
      rowCount: freezed == rowCount
          ? _value.rowCount
          : rowCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ElementModelImplCopyWith<$Res>
    implements $ElementModelCopyWith<$Res> {
  factory _$$ElementModelImplCopyWith(
          _$ElementModelImpl value, $Res Function(_$ElementModelImpl) then) =
      __$$ElementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? title,
      String? description,
      ElementType type,
      ElementLayoutType layoutType,
      List<ElementModel> children,
      Map<String, List<ElementModel>> gridChildren,
      int? columnCount,
      int? rowCount});
}

/// @nodoc
class __$$ElementModelImplCopyWithImpl<$Res>
    extends _$ElementModelCopyWithImpl<$Res, _$ElementModelImpl>
    implements _$$ElementModelImplCopyWith<$Res> {
  __$$ElementModelImplCopyWithImpl(
      _$ElementModelImpl _value, $Res Function(_$ElementModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? type = null,
    Object? layoutType = null,
    Object? children = null,
    Object? gridChildren = null,
    Object? columnCount = freezed,
    Object? rowCount = freezed,
  }) {
    return _then(_$ElementModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ElementType,
      layoutType: null == layoutType
          ? _value.layoutType
          : layoutType // ignore: cast_nullable_to_non_nullable
              as ElementLayoutType,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ElementModel>,
      gridChildren: null == gridChildren
          ? _value._gridChildren
          : gridChildren // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ElementModel>>,
      columnCount: freezed == columnCount
          ? _value.columnCount
          : columnCount // ignore: cast_nullable_to_non_nullable
              as int?,
      rowCount: freezed == rowCount
          ? _value.rowCount
          : rowCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ElementModelImpl extends _ElementModel {
  const _$ElementModelImpl(
      {required this.id,
      this.title,
      this.description,
      required this.type,
      required this.layoutType,
      final List<ElementModel> children = const [],
      final Map<String, List<ElementModel>> gridChildren = const {},
      this.columnCount,
      this.rowCount})
      : _children = children,
        _gridChildren = gridChildren,
        super._();

  @override
  final String id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final ElementType type;
  @override
  final ElementLayoutType layoutType;
  final List<ElementModel> _children;
  @override
  @JsonKey()
  List<ElementModel> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  final Map<String, List<ElementModel>> _gridChildren;
  @override
  @JsonKey()
  Map<String, List<ElementModel>> get gridChildren {
    if (_gridChildren is EqualUnmodifiableMapView) return _gridChildren;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_gridChildren);
  }

  @override
  final int? columnCount;
  @override
  final int? rowCount;

  @override
  String toString() {
    return 'ElementModel(id: $id, title: $title, description: $description, type: $type, layoutType: $layoutType, children: $children, gridChildren: $gridChildren, columnCount: $columnCount, rowCount: $rowCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElementModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.layoutType, layoutType) ||
                other.layoutType == layoutType) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            const DeepCollectionEquality()
                .equals(other._gridChildren, _gridChildren) &&
            (identical(other.columnCount, columnCount) ||
                other.columnCount == columnCount) &&
            (identical(other.rowCount, rowCount) ||
                other.rowCount == rowCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      type,
      layoutType,
      const DeepCollectionEquality().hash(_children),
      const DeepCollectionEquality().hash(_gridChildren),
      columnCount,
      rowCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ElementModelImplCopyWith<_$ElementModelImpl> get copyWith =>
      __$$ElementModelImplCopyWithImpl<_$ElementModelImpl>(this, _$identity);
}

abstract class _ElementModel extends ElementModel {
  const factory _ElementModel(
      {required final String id,
      final String? title,
      final String? description,
      required final ElementType type,
      required final ElementLayoutType layoutType,
      final List<ElementModel> children,
      final Map<String, List<ElementModel>> gridChildren,
      final int? columnCount,
      final int? rowCount}) = _$ElementModelImpl;
  const _ElementModel._() : super._();

  @override
  String get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  ElementType get type;
  @override
  ElementLayoutType get layoutType;
  @override
  List<ElementModel> get children;
  @override
  Map<String, List<ElementModel>> get gridChildren;
  @override
  int? get columnCount;
  @override
  int? get rowCount;
  @override
  @JsonKey(ignore: true)
  _$$ElementModelImplCopyWith<_$ElementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
