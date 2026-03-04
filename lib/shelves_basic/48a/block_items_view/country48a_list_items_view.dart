import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../block/country48a_block.dart';
import '../widget/country48a_list_item.dart';

class Country48aListItemsView extends BlockItemsView<Country48aBlock> {
  const Country48aListItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: _onScrollEndNotification,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
        children: block.items
            .map(
              (item) => Country48aListItem(
                countryInfo: item,
                selected: block.isCurrentItem(item),
                onCountryPressed: _onCountry48aPressed,
              ),
            )
            .toList(),
      ),
    );
  }

  bool _onScrollEndNotification(ScrollEndNotification notification) {
    PaginationInfo? pagination = block.paginationInfo;
    if (pagination == null) {
      return false;
    }
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent &&
        pagination.currentPage < pagination.totalPages) {
      _loadMore();
      return true;
    }
    return false;
  }

  Future<void> _loadMore() async {
    await block.queryMore();
  }

  void _onCountry48aPressed(CountryInfo countryInfo) {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    block.refreshItemAndSetAsCurrent(item: countryInfo, navigate: null);
  }
}
