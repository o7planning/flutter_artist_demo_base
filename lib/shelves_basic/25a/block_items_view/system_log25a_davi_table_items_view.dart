import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_fa_davi_table/flutter_fa_davi_table.dart';

import '../../../model/model.dart';
import '../block/system_log25a_block.dart';

class SystemLog25aDaviTableItemsView extends BlockItemsView<SystemLog25aBlock> {
  const SystemLog25aDaviTableItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return _buildTable(context);
  }

  Widget _buildTable(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 0),
      child: DaviTheme(
        data: _daviThemeData(),
        child: FaDaviTable<int, SystemLogInfo>(
          items: block.items,
          getItemId: (item) => item.id,
          sortRuleSide: SortRuleSide.blockSide,
          visibleRowsCount: 10,
          onRowTap: (SystemLogInfo systemLogInfo) {
            _onSelectSystemLog(systemLogInfo);
          },
          rowColor: (param) {
            return param.data.id == block.currentItem?.id
                ? Colors.indigo.withAlpha(50)
                : null;
          },
          modelSettings: FaDaviTableModelSettings<SystemLogInfo>(
            columns: [
              DaviColumn(
                name: 'System Log ID',
                width: 160,
                cellValue: (param) {
                  return param.data.id;
                },
              ),
              DaviColumn(
                name: 'Date Time',
                width: 160,
                cellValue: (param) {
                  return param.data.createDateTime;
                },
              ),
              DaviColumn(
                name: 'Content',
                grow: 1,
                cellValue: (param) {
                  return param.data.content;
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
      scrollbar: const TableScrollbarThemeData(
        horizontalOnlyWhenNeeded: true,
        verticalOnlyWhenNeeded: true,
      ),
      header: const HeaderThemeData(),
      headerCell: const HeaderCellThemeData(
        padding: EdgeInsets.all(5),
        height: 30,
      ),
      row: RowThemeData(
        dividerThickness: 0.4,
        fillHeight: true,
        color: null,
        hoverBackground: (int row) {
          return Colors.greenAccent.withAlpha(30);
        },
      ),
      cell: const CellThemeData(padding: EdgeInsets.all(5), contentHeight: 30),
    );
  }

  void _onSelectSystemLog(SystemLogInfo systemLog) {
    block.refreshItemAndSetAsCurrent(item: systemLog);
  }
}
