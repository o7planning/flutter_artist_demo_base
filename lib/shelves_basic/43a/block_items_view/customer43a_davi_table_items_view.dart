import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_fa_davi_table/flutter_fa_davi_table.dart';

import '../../../model/model.dart';
import '../../../widgets/image_url_view.dart';
import '../action/custome43a_vip_update_action.dart';
import '../block/customer43a_block.dart';

class Customer43aDaviTableItemsView extends BlockItemsView<Customer43aBlock> {
  const Customer43aDaviTableItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return _buildTable(context);
  }

  Widget _buildTable(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 0),
      child: DaviTheme(
        data: _daviThemeData(),
        child: FaDaviTable<int, CustomerInfo>(
          items: block.items,
          getItemId: (item) => item.id,
          sortRuleSide: SortRuleSide.blockSide,
          visibleRowsCount: 10,
          onRowTap: (CustomerInfo customerInfo) {
            _onSelectCustomer(customerInfo);
          },
          rowColor: (param) {
            return param.data.id == block.currentItem?.id
                ? Colors.indigo.withAlpha(50)
                : null;
          },
          modelSettings: FaDaviTableModelSettings<CustomerInfo>(
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
                name: 'Code',
                width: 110,
                cellValue: (param) {
                  return param.data.code;
                },
              ),
              DaviColumn(
                name: 'Name',
                grow: 1,
                cellValue: (param) {
                  return param.data.name;
                },
              ),
              DaviColumn(
                name: 'VIP?',
                width: 60,
                headerAlignment: Alignment.center,
                cellAlignment: Alignment.center,
                cellWidget: (param) {
                  return Checkbox(
                    value: param.data.vip,
                    onChanged: (bool? value) {
                      _onChangedVip(
                        customerInfo: param.data,
                        vip: value ?? false,
                      );
                    },
                  );
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

  void _onSelectCustomer(CustomerInfo customer) {
    block.refreshItemAndSetAsCurrent(item: customer);
  }

  Future<void> _onChangedVip({
    required CustomerInfo customerInfo,
    required bool vip,
  }) async {
    // Debug:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: {"customerInfo": customerInfo, "vip": vip},
    );
    //
    final updateAction = Customer43aVipUpdateAction(
      item: customerInfo,
      config: BlockQuickItemUpdateActionConfig(errorIfItemNotInTheBlock: true),
      vip: vip,
      needToConfirm: true,
      actionInfo:
          'Update VIP to "$vip" for Customer:\n'
          '${customerInfo.code} - ${customerInfo.name}',
    );
    // Customer43aBlock block:
    await block.executeQuickItemUpdateAction(action: updateAction);
  }
}
