import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/enums/element_layout_type_enum.dart';
import 'package:flutter_web_formbuilder/enums/element_type_enum.dart';
import 'package:flutter_web_formbuilder/models/definition_model.dart';
import 'package:flutter_web_formbuilder/models/element_config_model.dart';
import 'package:flutter_web_formbuilder/styles/icon_styles.dart';
import 'package:flutter_web_formbuilder/widgets/draggable_field_tile.dart';
import 'package:flutter_web_formbuilder/widgets/toolbar_title.dart';
import 'package:gap/gap.dart';

final Iterable<DefinitionModel> dummyFields = [
  DefinitionModel(
    title: 'Text field',
    description: 'This is a text field',
    layoutType: ElementLayoutType.input,
    type: ElementType.text,
    icon: IconStyles.iconTextFields,
    config: ElementConfigModel(
      labelText: 'Text field',
      hintText: '',
      initialValue: '',
      minLength: 0,
      maxLength: 0,
    ),
  ),
  DefinitionModel(
    title: 'Number field',
    description: 'This is a number field',
    layoutType: ElementLayoutType.input,
    type: ElementType.number,
    icon: IconStyles.iconNumbers,
    config: ElementConfigModel(
      labelText: 'Number field',
      hintText: '',
      initialValue: '',
      minValue: 0,
      maxValue: 0,
    ),
  ),
  DefinitionModel(
    title: 'Date field',
    description: 'This is a date field',
    layoutType: ElementLayoutType.input,
    type: ElementType.date,
    icon: IconStyles.iconDate,
    config: ElementConfigModel(
      labelText: 'Date field',
      hintText: '',
      initialValue: '',
    ),
  ),
  DefinitionModel(
    title: 'Dropdown field',
    description: 'This is a dropdown field',
    layoutType: ElementLayoutType.input,
    type: ElementType.dropdown,
    icon: IconStyles.iconDropdown,
    config: ElementConfigModel(
      labelText: 'Dropdown field',
      hintText: '',
      initialValue: '',
    ),
  ),
];

final Iterable<DefinitionModel> dummyLayouts = [
  DefinitionModel(
    title: 'Grid',
    description: 'This is a grid layout field',
    layoutType: ElementLayoutType.layout,
    type: ElementType.grid,
    icon: IconStyles.iconGrid,
    config: ElementConfigModel(
      labelText: 'Grid field',
    ),
  ),
];

class HomeScreenToolbar extends StatefulWidget {
  const HomeScreenToolbar({super.key});

  @override
  State<HomeScreenToolbar> createState() => _HomeScreenToolbarState();
}

class _HomeScreenToolbarState extends State<HomeScreenToolbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 250,
      // constraints: const BoxConstraints(
      //   minWidth: 250,
      //   maxWidth: 250,
      // ),
      color: Colors.grey.shade300,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ToolbarTitle(
            title: 'Input fields',
          ),
          const Gap(8),
          ListView.builder(
            shrinkWrap: true,
            itemCount: dummyFields.length,
            itemBuilder: (context, index) {
              final item = dummyFields.elementAt(index);

              return Column(
                children: [
                  DraggableFieldTile(
                    dragInfo: item.toDragInfo(),
                    icon: item.icon,
                  ),
                  const Gap(8),
                ],
              );
            },
          ),
          const ToolbarTitle(
            title: 'Layout fields',
          ),
          const Gap(8),
          ListView.builder(
            shrinkWrap: true,
            itemCount: dummyLayouts.length,
            itemBuilder: (context, index) {
              final item = dummyLayouts.elementAt(index);
              return Column(
                children: [
                  DraggableFieldTile(
                    dragInfo: item.toDragInfo(),
                    icon: item.icon,
                  ),
                  const Gap(8),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
