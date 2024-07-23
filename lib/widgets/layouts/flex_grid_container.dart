import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/widgets/layouts/flex_grid.dart';

class FlexGridContainer extends StatelessWidget {
  const FlexGridContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexGrid(
      columnCount: 2,
      rowCount: 2,
    );
  }
}
