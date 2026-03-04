import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../block/supplier26a_block.dart';
import '../widget/supplier26a_list_item.dart';

class Supplier26aListItemsView extends BlockItemsView<Supplier26aBlock> {
  const Supplier26aListItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: block.items
          .map(
            (item) => Supplier26aListItem(
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
