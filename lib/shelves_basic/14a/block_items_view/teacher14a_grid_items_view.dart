import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../../../widgets/custom_slivergriddelegate.dart';
import '../block/teacher14a_block.dart';
import '../widget/teacher14a_box.dart';

class Teacher14aGridItemsView extends BlockItemsView<Teacher14aBlock> {
  const Teacher14aGridItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return GridView.builder(
      itemCount: block.items.length,
      gridDelegate: const ChildFixedMainExtentAndMinCrossExtentSGD(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childMainAxisExtent: 100, // height
        minChildCrossAxisExtent: 220, // width
      ),
      itemBuilder: (BuildContext context, int index) {
        TeacherInfo item = block.items[index];
        return Teacher14aBox(
          teacherInfo: item,
          selected: block.isCurrentItem(item),
          onTeacherPressed: _onTeacherPressed,
        );
      },
    );
  }

  void _onTeacherPressed(TeacherInfo teacherInfo) {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    block.refreshItemAndSetAsCurrent(item: teacherInfo, navigate: null);
  }
}
