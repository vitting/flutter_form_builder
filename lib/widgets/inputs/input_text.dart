import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String labelText;
  final bool enabled;
  final bool readOnly;
  const InputText({
    super.key,
    required this.labelText,
    this.enabled = true,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
      ),
      initialValue: '',
      enabled: enabled,
      readOnly: readOnly,
    );
  }
}
