enum ElementInputType {
  text,
  number,
  date,
  email,
  checkbox,
  checkboxList,
}

enum ElementLayoutType {
  grid,
  title,
}

class ElementModel {
  ElementModel({
    required this.id,
    required this.title,
    required this.description,
    required this.inputType,
    required this.layoutType,
  });

  final String description;
  final String id;
  final ElementInputType? inputType;
  final ElementLayoutType? layoutType;
  final String title;
}
