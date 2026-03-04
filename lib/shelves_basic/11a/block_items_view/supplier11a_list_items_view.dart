import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../block/supplier11a_block.dart';
import '../widget/supplier11a_list_item.dart';

class Supplier11aListItemsView extends BlockItemsView<Supplier11aBlock> {
  const Supplier11aListItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: block.items
          .map(
            (item) => Supplier11aListItem(
              supplierInfo: item,
              selected: block.isCurrentItem(item),
              onSupplierPressed: _onSupplierPressed,
            ),
          )
          .toList(),
    );
  }

  Future<void> _onSupplierPressed(SupplierInfo supplierInfo) async {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    await block.refreshItemAndSetAsCurrent(item: supplierInfo, navigate: null);
  }
}
