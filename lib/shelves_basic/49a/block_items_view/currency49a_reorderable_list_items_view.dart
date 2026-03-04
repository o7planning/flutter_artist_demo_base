import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../block/currency49a_block.dart';
import '../widget/currency49a_list_item.dart';

class Currency49aReorderableListItemsView
    extends BlockItemsView<Currency49aBlock> {
  const Currency49aReorderableListItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    List<CurrencyInfo> currencyInfos = block.items;
    //
    return ReorderableListView.builder(
      padding: EdgeInsets.all(5.0),
      itemCount: currencyInfos.length,
      onReorder: _onReorder,
      itemBuilder: (context, index) {
        CurrencyInfo currencyInfo = currencyInfos[index];
        return Currency49aListItem(
          key: Key("Currency-${currencyInfo.id}"),
          currencyInfo: currencyInfo,
          selected: block.isCurrentItem(currencyInfo),
          onCurrencyPressed: _onCurrencyPressed,
        );
      },
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    int newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;
    block.moveItemByIndexPosition(
      oldIndexPosition: oldIndex,
      newIndexPosition: newIdx,
    );
  }

  void _onCurrencyPressed(CurrencyInfo currencyInfo) {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    // IMPORTANT:
    // - Call this method when the user clicks on an ITEM in the list.
    block.refreshItemAndSetAsCurrent(item: currencyInfo, navigate: null);
  }
}
