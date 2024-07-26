import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/screens/home_screen.dart';
import 'package:flutter_web_formbuilder/styles/icon_styles.dart';

class FormBuilderApp extends StatelessWidget {
  const FormBuilderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        iconTheme: IconThemeData(
          color: IconStyles.colorActionIcon,
          fill: 0,
          weight: 300,
          opticalSize: 24,
          grade: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
