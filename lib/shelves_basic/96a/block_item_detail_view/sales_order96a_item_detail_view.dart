import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/utils/number_format_utils.dart';

import '../../../model/model.dart';
import '../../../widgets/custom_app_container.dart';
import '../block/sales_order96a_block.dart';
import '../dialog/sales_order_96a_dialog.dart';

class SalesOrder96aItemDetailView
    extends BlockItemDetailView<SalesOrder96aBlock> {
  const SalesOrder96aItemDetailView({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    SalesOrderInfo? salesOrderInfo = block.currentItem;
    SalesOrderData? salesOrderData = block.currentItemDetail;

    return CustomAppContainer(
      width: double.maxFinite,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("SalesOrder: #${salesOrderData?.id ?? ' - '}"),
              SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(3),
                  minimumSize: Size.zero,
                ),
                onPressed: salesOrderInfo == null
                    ? null
                    : () {
                        _onEditSalesOrder(context, salesOrderInfo);
                      },
                child: Icon(Icons.edit),
              ),
            ],
          ),

          SizedBox(height: 5),
          Text(
            "Customer: ${salesOrderData?.customer?.code ?? ' - '}. "
            "${salesOrderData?.customer?.name ?? ' - '}",
          ),
          SizedBox(height: 5),
          Text(
            "Amount: ${formatCurrency(salesOrderData?.amount ?? 0)}  "
            "Tax Amount: ${formatCurrency(salesOrderData?.taxAmount ?? 0)}",
          ),
        ],
      ),
    );
  }

  Future<void> _onEditSalesOrder(
    BuildContext context,
    SalesOrderInfo salesOrderInfo,
  ) async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: {"salesOrderInfo": salesOrderInfo},
    );
    //
    BlockCurrentItemSettingResult result = await block
        .refreshItemAndSetAsCurrent(item: salesOrderInfo, forceLoadForm: true);
    if (result.successForFirst) {
      SalesOrder96aDialog.openDialog(context);
    }
  }
}
