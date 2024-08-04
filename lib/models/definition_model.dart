import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_web_formbuilder/enums/element_layout_type_enum.dart';
import 'package:flutter_web_formbuilder/enums/element_type_enum.dart';
import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:flutter_web_formbuilder/models/element_config_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'definition_model.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class DefinitionModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final ElementLayoutType layoutType;
  final ElementType type;
  final ElementConfigModel config;
  final String iconName;

  const DefinitionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.layoutType,
    required this.type,
    required this.iconName,
    required this.config,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        layoutType,
        type,
        config,
        iconName,
      ];

  @override
  bool get stringify => true;

  factory DefinitionModel.fromJson(Map<String, dynamic> json) =>
      _$DefinitionModelFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionModelToJson(this);

  DragInfo toDragInfo() {
    return DragInfo(
      title: title,
      description: description,
      type: type,
      layoutType: layoutType,
      config: config,
    );
  }
}
