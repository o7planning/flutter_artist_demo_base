import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

// Theme.
DaviThemeData getDemoDaviTableThemeData() {
  return DaviThemeData(
    columnDividerThickness: 0.4,
    columnDividerFillHeight: true,
    decoration: BoxDecoration(
      border: Border.all(width: 0.2, color: Colors.grey),
    ),
    scrollbar: TableScrollbarThemeData(
      horizontalOnlyWhenNeeded: true,
      verticalOnlyWhenNeeded: true,
    ),
    header: HeaderThemeData(),
    headerCell: HeaderCellThemeData(padding: EdgeInsets.all(5), height: 30),
    row: RowThemeData(
      dividerThickness: 0.4,
      fillHeight: true,
      color: null,
      hoverBackground: (int row) {
        return Colors.greenAccent.withAlpha(30);
      },
    ),
    cell: CellThemeData(padding: EdgeInsets.all(5), contentHeight: 30),
  );
}
