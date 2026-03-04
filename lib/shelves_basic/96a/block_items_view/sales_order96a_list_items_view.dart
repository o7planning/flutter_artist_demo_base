import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../block/sales_order96a_block.dart';
import '../widget/sales_order96a_list_item.dart';

class SalesOrder96aListItemsView extends BlockItemsView<SalesOrder96aBlock> {
  const SalesOrder96aListItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: block.items
          .map(
            (item) => SalesOrder96aListItem(
              salesOrderInfo: item,
              selected: block.isCurrentItem(item),
              onSalesOrderPressed: _onSalesOrderPressed,
            ),
          )
          .toList(),
    );
  }

  void _onSalesOrderPressed(SalesOrderInfo salesOrderInfo) {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    block.refreshItemAndSetAsCurrent(item: salesOrderInfo, navigate: null);
  }
}
