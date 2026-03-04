import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../block/employment_history36a_block.dart';
import '../widget/employment_history36a_list_item.dart';

class EmploymentHistory36aListItemsView
    extends BlockItemsView<EmploymentHistory36aBlock> {
  const EmploymentHistory36aListItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    List<EmploymentHistoryInfo> employmentHistoryInfos = block.items;
    //
    return ListView(
      children: employmentHistoryInfos
          .map(
            (item) => EmploymentHistory36aListItem(
              employmentHistoryInfo: item,
              selected: block.isCurrentItem(item),
              onEmploymentHistoryPressed: _onEmploymentHistoryPressed,
            ),
          )
          .toList(),
    );
  }

  void _onEmploymentHistoryPressed(
    EmploymentHistoryInfo employmentHistoryInfo,
  ) {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    // IMPORTANT:
    // - Call this method when the user clicks on an ITEM in the list.
    block.refreshItemAndSetAsCurrent(
      item: employmentHistoryInfo,
      navigate: null,
    );
  }
}
