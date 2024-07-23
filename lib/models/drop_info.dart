import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:uuid/uuid.dart';

class DropInfo {
  final String title;
  final String description;
  final DragInfoType type;
  final String id;

  DropInfo({
    required this.title,
    required this.description,
    required this.type,
    required this.id,
  });

  factory DropInfo.fromDragInfo(DragInfo dragInfo) {
    return DropInfo(
      title: dragInfo.title,
      description: dragInfo.description,
      type: dragInfo.type,
      id: const Uuid().v4(),
    );
  }
}
