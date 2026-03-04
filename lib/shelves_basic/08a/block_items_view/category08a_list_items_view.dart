import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../block/category08a_block.dart';
import '../widget/category08_list_item.dart';

class Category08aListItemsView extends BlockItemsView<Category08aBlock> {
  const Category08aListItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: block.items
          .map(
            (item) => Category08aListItem(
              categoryInfo: item,
              selected: block.isCurrentItem(item),
              onCategoryPressed: _onCategoryPressed,
            ),
          )
          .toList(),
    );
  }

  void _onCategoryPressed(CategoryInfo categoryInfo) {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    block.refreshItemAndSetAsCurrent(item: categoryInfo, navigate: null);
  }
}
