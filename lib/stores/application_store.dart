import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:signals/signals.dart';
import 'package:uuid/uuid.dart';

final Iterable<ElementModel> dummy = [
  ElementModel(
    id: const Uuid().v4(),
    title: 'Text field',
    description: 'This is a text field',
    type: ElementType.text,
    layoutType: ElementLayoutType.input,
  ),
  ElementModel(
    id: const Uuid().v4(),
    title: 'Number field',
    description: 'This is a number field',
    type: ElementType.number,
    layoutType: ElementLayoutType.input,
  ),
];

class ApplicationStore {
  static final items = listSignal<ElementModel>(dummy.toList());
}
