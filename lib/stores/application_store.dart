import 'package:flutter_web_formbuilder/models/drop_info.dart';
import 'package:signals/signals.dart';

class ApplicationStore {
  static final items = listSignal<DropInfo>([]);
}
