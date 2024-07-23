import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: rowCount,
          itemBuilder: (context, rowIndex) {
            bool isLast = rowIndex == rowCount - 1;
            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : rowGap),
              child: Row(
                children: List.generate(
                  columnCount,
                  (columnIndex) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          right:
                              columnIndex == columnCount - 1 ? 0 : columnGap),
                      child: Container(
                        color: Colors.blue.shade100,
                        height: 80,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
