enum DragInfoType {
  input,
  layout,
}

class DragInfo {
  final String title;
  final String description;
  final DragInfoType type;
  final String id;

  DragInfo({
    required this.title,
    required this.description,
    required this.type,
    required this.id,
  });
}
