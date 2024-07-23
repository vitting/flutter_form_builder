import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/models/definition_model.dart';
import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:flutter_web_formbuilder/models/element_model.dart';
import 'package:flutter_web_formbuilder/widgets/draggable_field_tile.dart';
import 'package:gap/gap.dart';

final Iterable<DefinitionModel> dummyFields = [
  DefinitionModel(
    title: 'Text field',
    description: 'This is a text field',
    layoutType: ElementLayoutType.input,
    type: ElementType.text,
    icon: Icons.text_fields,
  ),
  DefinitionModel(
    title: 'Number field',
    description: 'This is a number field',
    layoutType: ElementLayoutType.input,
    type: ElementType.number,
    icon: Icons.numbers,
  ),
];

final Iterable<DefinitionModel> dummyLayouts = [
  DefinitionModel(
    title: 'Grid',
    description: 'This is a grid layout field',
    layoutType: ElementLayoutType.layout,
    type: ElementType.grid,
    icon: Icons.view_comfy,
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
      constraints: const BoxConstraints(
        minWidth: 250,
        maxWidth: 250,
      ),
      color: Colors.grey.shade300,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Input fields',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
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
                    dragInfo: DragInfo(
                      layoutType: item.layoutType,
                      type: item.type,
                      description: item.description,
                      title: item.title,
                    ),
                    icon: item.icon,
                  ),
                  const Gap(8),
                ],
              );
            },
          ),
          const Text(
            'Layout fields',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
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
                    dragInfo: DragInfo(
                      layoutType: item.layoutType,
                      type: item.type,
                      description: item.description,
                      title: item.title,
                    ),
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
