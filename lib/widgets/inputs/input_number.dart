import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputNumber extends StatelessWidget {
  final String? labelText;
  final bool enabled;
  final bool readOnly;
  const InputNumber({
    super.key,
    this.labelText,
    this.enabled = true,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
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
