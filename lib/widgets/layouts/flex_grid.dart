import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/models/drag_info.dart';
import 'package:flutter_web_formbuilder/screens/home_screen_body.dart';

class FlexGrid extends StatelessWidget {
  final int columnCount;
  final int rowCount;
  final double rowGap;
  final double columnGap;
  const FlexGrid({
    super.key,
    required this.columnCount,
    this.rowCount = 1,
    this.rowGap = 1,
    this.columnGap = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Grid title'),
        ...List.generate(
          rowCount,
          (rowIndex) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: rowIndex == rowCount - 1 ? 0 : rowGap),
              child: Row(
                children: List.generate(
                  columnCount,
                  (columnIndex) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: columnIndex == columnCount - 1 ? 0 : columnGap,
                      ),
                      child: DragTarget<DragInfo>(
                        onMove: (details) => debugPrint('onMove'),
                        builder: (context, candidateData, rejectedData) =>
                            Container(
                          color: Colors.blue.shade100,
                          height: 80,
                          child: const Column(
                            children: [],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
