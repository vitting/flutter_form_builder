import 'package:flutter/material.dart';
import 'package:signals/signals.dart';

class DragAndDropStore {
  static final Signal<bool> showDropTarget = signal(false);
  static final Signal<IconData?> dropIcon = signal(null);
  static final Signal<String?> dropTitle = signal(null);
  static final Signal<String> highlightId = signal('');
}
