import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/get_it/get_it.dart';
import 'package:flutter_web_formbuilder/models/definition_model.dart';
import 'package:flutter_web_formbuilder/repositories/tool_field_repository.dart';
import 'package:flutter_web_formbuilder/styles/icon_styles.dart';
import 'package:flutter_web_formbuilder/widgets/draggable_field_tile.dart';
import 'package:flutter_web_formbuilder/widgets/toolbar_title.dart';
import 'package:gap/gap.dart';

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
          FutureBuilder<Iterable<DefinitionModel>>(
              future: getIt<ToolFieldRepository>().getToolInputFields(),
              builder: (BuildContext context,
                  AsyncSnapshot<Iterable<DefinitionModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return const Text('Error');
                }
                final data = snapshot.data as Iterable<DefinitionModel>;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data.elementAt(index);

                    return Column(
                      children: [
                        DraggableFieldTile(
                          dragInfo: item.toDragInfo(),
                          icon: iconMap[item.iconName]!,
                        ),
                        const Gap(8),
                      ],
                    );
                  },
                );
              }),
          const ToolbarTitle(
            title: 'Layout fields',
          ),
          const Gap(8),
          FutureBuilder(
              future: getIt<ToolFieldRepository>().getToolLayoutFields(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return const Text('Error');
                }
                final data = snapshot.data as Iterable<DefinitionModel>;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data.elementAt(index);
                    return Column(
                      children: [
                        DraggableFieldTile(
                          dragInfo: item.toDragInfo(),
                          icon: iconMap[item.iconName]!,
                        ),
                        const Gap(8),
                      ],
                    );
                  },
                );
              }),
          ElevatedButton(
              onPressed: () async {
                final data =
                    await getIt<ToolFieldRepository>().getToolInputFields();
                debugPrint(data.toString());
              },
              child: const Text('Test'))
        ],
      ),
    );
  }
}
