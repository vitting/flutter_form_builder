import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:uuid/uuid.dart';

enum ElementType {
  text,
  number,
  date,
  email,
  checkbox,
  checkboxList,
  grid,
}

enum ElementLayoutType {
  input,
  layout,
}

class ElementModel {
  ElementModel({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.layoutType,
  });

  final String description;
  final String id;
  final ElementType? type;
  final ElementLayoutType? layoutType;
  final String title;

  factory ElementModel.fromDragInfo(DragInfo dragInfo) {
    return ElementModel(
      title: dragInfo.title,
      description: dragInfo.description,
      layoutType: dragInfo.layoutType,
      type: dragInfo.type,
      id: const Uuid().v4(),
    );
  }
}
