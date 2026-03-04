import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../block/currency01a_block.dart';
import '../widget/currency01a_list_item.dart';

class Currency01aListItemsView extends BlockItemsView<Currency01aBlock> {
  const Currency01aListItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    List<CurrencyInfo> currencyInfos = block.items;
    //
    return ListView(
      padding: const EdgeInsets.all(5),
      children: currencyInfos
          .map(
            (item) => Currency01aListItem(
              currencyInfo: item,
              selected: block.isCurrentItem(item),
              onCurrencyPressed: _onCurrencyPressed,
            ),
          )
          .toList(),
    );
  }

  Future<void> _onCurrencyPressed(CurrencyInfo currencyInfo) async {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    // IMPORTANT:
    // - Call this method when the user clicks on an ITEM in the list.
    await block.refreshItemAndSetAsCurrent(item: currencyInfo, navigate: null);
  }
}
