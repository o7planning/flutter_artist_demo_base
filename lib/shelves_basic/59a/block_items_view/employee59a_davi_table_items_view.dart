import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_fa_davi_table/flutter_fa_davi_table.dart';

import '../../../model/model.dart';
import '../../../widgets/image_url_view.dart';
import '../block/employee59a_block.dart';

class Employee59aDaviTableItemsView extends BlockItemsView<Employee59aBlock> {
  const Employee59aDaviTableItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return _buildTable(context);
  }

  Widget _buildTable(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 0),
      child: DaviTheme(
        data: _daviThemeData(),
        child: FaDaviTable<int, EmployeeInfo>(
          items: block.items,
          getItemId: (item) => item.id,
          sortRuleSide: SortRuleSide.blockSide,
          visibleRowsCount: 10,
          onRowTap: (EmployeeInfo employeeInfo) {
            _onSelectEmployee(employeeInfo);
          },
          rowColor: (param) {
            return param.data.id == block.currentItem?.id
                ? Colors.indigo.withAlpha(50)
                : null;
          },
          modelSettings: FaDaviTableModelSettings<EmployeeInfo>(
            columns: [
              DaviColumn(
                name: 'Image',
                resizable: false,
                width: 70,
                cellWidget: (param) {
                  return Center(
                    child: ImageUrlView(
                      imageUrl: param.data.imageUrl,
                      size: 30,
                      boxShape: BoxShape.rectangle,
                    ),
                  );
                },
              ),
              DaviColumn(
                name: 'Emp Number',
                width: 110,
                cellValue: (param) {
                  return param.data.empNumber;
                },
              ),
              DaviColumn(
                name: 'Name',
                grow: 1,
                cellValue: (param) {
                  return param.data.name;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  DaviThemeData _daviThemeData() {
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

  void _onSelectEmployee(EmployeeInfo employee) {
    block.refreshItemAndSetAsCurrent(item: employee);
  }
}
