import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/enums/element_layout_type_enum.dart';
import 'package:flutter_web_formbuilder/enums/element_type_enum.dart';
import 'package:flutter_web_formbuilder/models/drag_info.dart';

class DefinitionModel {
  final String title;
  final String description;
  final ElementLayoutType layoutType;
  final ElementType type;
  final IconData icon;

  DefinitionModel({
    required this.title,
    required this.description,
    required this.layoutType,
    required this.type,
    required this.icon,
  });

  DragInfo toDragInfo() {
    return DragInfo(
        title: title,
        description: description,
        type: type,
        layoutType: layoutType);
  }
}
