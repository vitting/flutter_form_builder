import 'package:flutter/material.dart';

class InputDropdown extends StatelessWidget {
  final String? labelText;
  final bool readOnly;
  const InputDropdown({
    super.key,
    this.labelText,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      value: null,
      items: const [
        DropdownMenuItem(
          value: 'One',
          child: Text('One'),
        ),
        DropdownMenuItem(
          value: 'Two',
          child: Text('Two'),
        ),
        DropdownMenuItem(
          value: 'Three',
          child: Text('Three'),
        ),
      ],
      onChanged: readOnly ? null : (value) {},
    );
  }
}
