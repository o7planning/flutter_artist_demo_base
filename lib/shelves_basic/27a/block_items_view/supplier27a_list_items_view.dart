import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../block/supplier27a_block.dart';
import '../widget/supplier27a_list_item.dart';

class Supplier27aListItemsView extends BlockItemsView<Supplier27aBlock> {
  const Supplier27aListItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return ListView(
      children: block.items
          .map(
            (item) => Supplier27aListItem(
              supplierInfo: item,
              selected: block.isCurrentItem(item),
              onSupplierPressed: _onSupplierPressed,
            ),
          )
          .toList(),
    );
  }

  void _onSupplierPressed(SupplierInfo supplierInfo) {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    block.refreshItemAndSetAsCurrent(item: supplierInfo, navigate: null);
  }
}
