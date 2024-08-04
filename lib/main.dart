import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/form_builder_app.dart';
import 'package:flutter_web_formbuilder/get_it/get_it.dart';
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await findSystemLocale();
  setupGetIt();
  runApp(const FormBuilderApp());
}
