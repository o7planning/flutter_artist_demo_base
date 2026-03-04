import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/widgets/image_url_view.dart';
import 'package:flutter_fa_davi_table/flutter_fa_davi_table.dart';

import '../../../model/model.dart';
import '../../../utils/number_format_utils.dart';
import '../block/sales_order_line96a_block.dart';
import '../dialog/sales_order_line96a_dialog.dart';

class SalesOrderLine96aDaviTableItemsView
    extends BlockItemsView<SalesOrderLine96aBlock> {
  const SalesOrderLine96aDaviTableItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: DaviTheme(
        data: _daviThemeData(),
        child: FaDaviTable<int, SalesOrderLineInfo>(
          items: block.items,
          getItemId: (item) => item.id,
          sortRuleSide: SortRuleSide.blockSide,
          visibleRowsCount: 10,
          onRowTap: (SalesOrderLineInfo salesOrderLineInfo) {
            _onSelectSalesOrderLine(salesOrderLineInfo);
          },
          rowColor: (RowColorParams<SalesOrderLineInfo> param) {
            return param.data.id == block.currentItem?.id
                ? Colors.indigo.withAlpha(50)
                : null;
          },
          modelSettings: FaDaviTableModelSettings<SalesOrderLineInfo>(
            columns: [
              DaviColumn(
                name: 'Image',
                resizable: false,
                width: 70,
                cellWidget: (param) {
                  return Center(
                    child: ImageUrlView(
                      // param.data = SalesOrderLineInfo
                      imageUrl: param.data.product.imageUrl,
                      size: 30,
                      boxShape: BoxShape.rectangle,
                    ),
                  );
                },
              ),
              DaviColumn(
                name: 'Name',
                grow: 1,
                cellValue: (param) {
                  return param.data.product.name;
                },
              ),
              DaviColumn(
                name: 'Edit',
                headerAlignment: Alignment.center,
                width: 50,
                cellWidget: (param) {
                  return Center(
                    child: SimpleSmallIconButton(
                      onPressed: () {
                        _editSalesOrderLineDetail(context, param.data);
                      },
                      iconData: Icons.edit,
                    ),
                  );
                },
              ),
              DaviColumn(
                name: 'Units',
                cellWidget: (params) {
                  return Text(formatNumber(params.data.units));
                },
                cellAlignment: Alignment.centerRight,
              ),
              DaviColumn(
                name: 'Price (\$)',
                cellWidget: (params) {
                  return Text(formatCurrency(params.data.price));
                },
                cellAlignment: Alignment.centerRight,
              ),
              DaviColumn(
                name: 'Amount (\$)',
                cellWidget: (params) {
                  return Text(formatCurrency(params.data.amount));
                },
                cellAlignment: Alignment.centerRight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _editSalesOrderLineDetail(
    BuildContext context,
    SalesOrderLineInfo salesOrderLine,
  ) async {
    // SalesOrderLine96aBlock block:
    BlockCurrentItemSettingResult result = await block
        .refreshItemAndSetAsCurrent(item: salesOrderLine, forceLoadForm: true);
    if (!result.successForAll) {
      return;
    }
    SalesOrderLine96aDialog.openDialog(context);
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

  Future<void> _onSelectSalesOrderLine(
    SalesOrderLineInfo salesOrderLine,
  ) async {
    await block.refreshItemAndSetAsCurrent(item: salesOrderLine);
  }
}
