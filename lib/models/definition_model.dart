import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/enums/element_layout_type_enum.dart';
import 'package:flutter_web_formbuilder/enums/element_type_enum.dart';
import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:flutter_web_formbuilder/models/element_config_model.dart';

class DefinitionModel {
  final String title;
  final String description;
  final ElementLayoutType layoutType;
  final ElementType type;
  final ElementConfigModel config;
  final IconData icon;

  DefinitionModel({
    required this.title,
    required this.description,
    required this.layoutType,
    required this.type,
    required this.icon,
    required this.config,
  });

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
