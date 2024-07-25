import 'package:flutter_web_formbuilder/enums/element_layout_type_enum.dart';
import 'package:flutter_web_formbuilder/enums/element_type_enum.dart';

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
