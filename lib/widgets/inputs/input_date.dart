import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class InputDate extends StatelessWidget {
  final String? labelText;
  final bool enabled;
  final bool readOnly;
  const InputDate({
    super.key,
    this.labelText,
    this.enabled = true,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      mode: DateTimeFieldPickerMode.date,
      decoration: const InputDecoration(
        labelText: 'Enter Date',
      ),
      firstDate: DateTime.now().add(const Duration(days: 10)),
      lastDate: DateTime.now().add(const Duration(days: 40)),
      initialPickerDateTime: DateTime.now().add(const Duration(days: 20)),
      onChanged: (DateTime? value) {},
    );
  }
}
