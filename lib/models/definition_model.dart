import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';

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
}
