import 'package:flutter_web_formbuilder/models/element_model.dart';

class DragInfo {
  final String title;
  final String description;
  final ElementLayoutType layoutType;
  final ElementType type;

  DragInfo({
    required this.title,
    required this.description,
    required this.layoutType,
    required this.type,
  });
}
