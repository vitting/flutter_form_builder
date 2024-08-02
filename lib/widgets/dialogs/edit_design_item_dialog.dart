import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';

class EditDesignItemDialog extends StatefulWidget {
  final ElementModel item;
  const EditDesignItemDialog({
    super.key,
    required this.item,
  });

  @override
  State<EditDesignItemDialog> createState() => _EditDesignItemDialogState();

  static Future<void> show(BuildContext context, ElementModel item) async {
    await showDialog(
      context: context,
      builder: (context) {
        return EditDesignItemDialog(item: item);
      },
    );
  }
}

class _EditDesignItemDialogState extends State<EditDesignItemDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _labelTextController;
  late final TextEditingController _minLengthController;
  late final TextEditingController _maxLengthController;
  late final TextEditingController _minValueController;
  late final TextEditingController _maxValueController;

  @override
  void initState() {
    super.initState();

    _labelTextController =
        TextEditingController(text: widget.item.config.labelText);
    _minLengthController =
        TextEditingController(text: widget.item.config.minLength?.toString());
    _maxLengthController =
        TextEditingController(text: widget.item.config.maxLength?.toString());
    _minValueController =
        TextEditingController(text: widget.item.config.minValue?.toString());
    _maxValueController =
        TextEditingController(text: widget.item.config.maxValue?.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(16),
      title: const Text('Edit Element'),
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: [
              if (widget.item.config.labelText != null)
                TextFormField(
                  controller: _labelTextController,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Label Text',
                  ),
                ),
              if (widget.item.config.minLength != null)
                TextFormField(
                  controller: _minLengthController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Min length',
                  ),
                ),
              if (widget.item.config.maxLength != null)
                TextFormField(
                  controller: _maxLengthController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Max length',
                  ),
                ),
              if (widget.item.config.minValue != null)
                TextFormField(
                  controller: _minValueController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Min value',
                  ),
                ),
              if (widget.item.config.maxValue != null)
                TextFormField(
                  controller: _maxValueController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Max value',
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
