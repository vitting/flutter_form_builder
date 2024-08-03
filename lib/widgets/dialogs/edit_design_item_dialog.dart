import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/styles/icon_styles.dart';
import 'package:gap/gap.dart';

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
  late final TextEditingController _hintTextController;
  late final TextEditingController _initialValueTextController;
  late final TextEditingController _minLengthController;
  late final TextEditingController _maxLengthController;
  late final TextEditingController _minValueController;
  late final TextEditingController _maxValueController;

  @override
  void initState() {
    super.initState();

    _labelTextController =
        TextEditingController(text: widget.item.config.labelText);
    _hintTextController =
        TextEditingController(text: widget.item.config.hintText);
    _initialValueTextController =
        TextEditingController(text: widget.item.config.initialValue);
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
      title: SizedBox(
        width: 350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              child: Text(
                'Edit Element',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: const Icon(IconStyles.iconClose),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
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
              if (widget.item.config.hintText != null)
                TextFormField(
                  controller: _hintTextController,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Hint Text',
                  ),
                ),
              if (widget.item.config.initialValue != null)
                TextFormField(
                  controller: _initialValueTextController,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Initial value',
                  ),
                ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.item.config.minLength != null)
                    Flexible(
                      child: TextFormField(
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
                    ),
                  const Gap(8),
                  if (widget.item.config.maxLength != null)
                    Flexible(
                      child: TextFormField(
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
                    ),
                ],
              ),
              Row(
                children: [
                  if (widget.item.config.minValue != null)
                    Flexible(
                      child: TextFormField(
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
                    ),
                  const Gap(8),
                  if (widget.item.config.maxValue != null)
                    Flexible(
                      child: TextFormField(
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
                    ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
