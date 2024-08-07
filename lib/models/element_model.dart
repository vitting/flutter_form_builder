import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_web_formbuilder/enums/element_layout_type_enum.dart';
import 'package:flutter_web_formbuilder/enums/element_type_enum.dart';
import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:flutter_web_formbuilder/models/element_config_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'element_model.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class ElementModel extends Equatable {
  final String id;
  final String parentId;
  final String? description;
  final ElementType type;
  final ElementLayoutType layoutType;
  final List<List<List<ElementModel>>> gridChildren;
  final ElementConfigModel config;

  const ElementModel({
    required this.id,
    required this.parentId,
    this.description,
    required this.type,
    required this.layoutType,
    this.gridChildren = const [],
    required this.config,
  });

  @override
  List<Object?> get props => [
        id,
        parentId,
        description,
        type,
        layoutType,
        gridChildren,
        config,
      ];

  @override
  bool get stringify => true;

  factory ElementModel.fromJson(Map<String, dynamic> json) =>
      _$ElementModelFromJson(json);

  Map<String, dynamic> toJson() => _$ElementModelToJson(this);

  static List<List<List<ElementModel>>> _generateDefaultGridChildren({
    required int rowCount,
    required int columnCount,
  }) {
    return List.generate(
      rowCount,
      (rowIndex) => List.generate(
        columnCount,
        (columnIndex) => [],
      ),
    );
  }

  static ElementModel fromDragInfo(DragInfo dragInfo,
      {ElementModel? parentItem}) {
    final id = const Uuid().v4();
    return ElementModel(
      config: dragInfo.config,
      description: dragInfo.description,
      layoutType: dragInfo.layoutType,
      type: dragInfo.type,
      id: id,
      parentId: parentItem?.id ?? id,
      gridChildren: dragInfo.type == ElementType.grid
          ? _generateDefaultGridChildren(
              rowCount: 1,
              columnCount: 2,
            )
          : [],
    );
  }
}
