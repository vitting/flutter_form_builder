import 'package:flutter/material.dart';

class ToolbarTitle extends StatelessWidget {
  final String title;

  const ToolbarTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue.shade800,
      ),
    );
  }
}
