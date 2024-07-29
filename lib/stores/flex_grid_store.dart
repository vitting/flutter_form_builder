import 'package:signals/signals.dart';

class FlexGridStore {
  static final gridEditableId = signal<String?>(null);
  static final columnMenuActive = signal<String>('-1:-1');
}
