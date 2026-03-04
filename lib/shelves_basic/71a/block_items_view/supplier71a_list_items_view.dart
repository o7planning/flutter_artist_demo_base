import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../block/supplier71a_block.dart';
import '../widget/supplier71a_list_item.dart';

class Supplier71aListItemsView extends BlockItemsView<Supplier71aBlock> {
  const Supplier71aListItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return ListView(
      children: block.items
          .map(
            (item) => Supplier71aListItem(
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
