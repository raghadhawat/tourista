import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';

class PlanAndPlaneTable extends StatelessWidget {
  const PlanAndPlaneTable({
    super.key,
    required this.tableList,
    required this.rowNumber,
  });

  final List<Widget> tableList;
  final int rowNumber;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: FlexColumnWidth(),
      border: TableBorder.all(
        color: kYellowColor,
        width: 3,
        borderRadius: BorderRadius.circular(10),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: List.generate(
          rowNumber, (index) => TableRow(children: [tableList[index]])),
    );
  }
}
