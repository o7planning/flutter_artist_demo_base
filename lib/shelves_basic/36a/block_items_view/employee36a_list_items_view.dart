import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../block/employee36a_block.dart';
import '../widget/employee36a_list_item.dart';

class Employee36aListItemsView extends BlockItemsView<Employee36aBlock> {
  const Employee36aListItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    List<EmployeeInfo> employeeInfos = block.items;
    //
    return ListView(
      children: employeeInfos
          .map(
            (item) => Employee36aListItem(
              employeeInfo: item,
              selected: block.isCurrentItem(item),
              onEmployeePressed: _onEmployeePressed,
            ),
          )
          .toList(),
    );
  }

  void _onEmployeePressed(EmployeeInfo employeeInfo) {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    // IMPORTANT:
    // - Call this method when the user clicks on an ITEM in the list.
    block.refreshItemAndSetAsCurrent(item: employeeInfo, navigate: null);
  }
}
