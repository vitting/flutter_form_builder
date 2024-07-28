import 'package:signals/signals.dart';

class FlexGridStore {
  static final gridEditableId = signal<String>('');
  static final hideActionsId = computed(() => gridEditableId.value);
}
