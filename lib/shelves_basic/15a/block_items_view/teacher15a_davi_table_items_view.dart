import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/widgets/image_url_view.dart';
import 'package:flutter_fa_davi_table/flutter_fa_davi_table.dart';

import '../../../model/model.dart';
import '../block/teacher15a_block.dart';

class Teacher15aDaviTableItemsView extends BlockItemsView<Teacher15aBlock> {
  const Teacher15aDaviTableItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return _buildTableView(context);
  }

  Widget _buildTableView(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 0),
      child: DaviTheme(
        data: _daviThemeData(),
        child: FaDaviTable<int, TeacherInfo>(
          items: block.items,
          getItemId: (item) => item.id,
          sortRuleSide: SortRuleSide.blockSide,
          visibleRowsCount: 10,
          onRowTap: (TeacherInfo productInfo) {
            _onSelectProduct(productInfo);
          },
          rowColor: (RowColorParams<TeacherInfo> param) {
            return param.data.id == block.currentItem?.id
                ? Colors.indigo.withAlpha(50)
                : null;
          },
          modelSettings: FaDaviTableModelSettings<TeacherInfo>(
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
                name: 'Full Name',
                grow: 1,
                cellValue: (param) {
                  return param.data.fullName;
                },
                summary: (context) {
                  return Text("Items: ${block.itemCount}");
                },
              ),
              DaviColumn(
                name: 'Birthday',
                width: 90,
                cellValue: (param) {
                  return param.data.birthday;
                },
              ),
              DaviColumn(
                name: 'Position',
                width: 140,
                cellValue: (param) {
                  return param.data.position.name;
                },
              ),
              DaviColumn(
                name: 'Active',
                width: 60,
                cellWidget: (param) {
                  return Checkbox(value: param.data.active, onChanged: null);
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

  Future<void> _onSelectProduct(TeacherInfo product) async {
    await block.refreshItemAndSetAsCurrent(item: product);
  }
}
