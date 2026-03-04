import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../model/model.dart';
import '../block/note42a_block.dart';
import '../dialog/note42a_input_dialog.dart';
import '../widget/note42a_box.dart';

class Note42aStaggeredGridItemsView extends BlockItemsView<Note42aBlock> {
  const Note42aStaggeredGridItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    final List<NoteInfo> items = block.items;
    final int itemCount = items.length;
    //
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final int boxWidth = 200;
        int crossAxisCount = (constraints.constrainWidth() / boxWidth).toInt();
        //
        return MasonryGridView.count(
          itemCount: itemCount,
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          itemBuilder: (context, index) {
            NoteInfo noteInfo = items[index];
            bool selected = block.isCurrentItem(noteInfo);
            //
            return Note42aBox(
              noteInfo: noteInfo,
              selected: selected,
              onNoteBoxPressed: (NoteInfo noteInfo) {
                _onNotePressed(noteInfo);
              },
              onEditNoteBtnPressed: (NoteInfo noteInfo) {
                _onEditNoteBtnPressed(context, noteInfo);
              },
            );
          },
        );
      },
    );
  }

  Future<void> _onNotePressed(NoteInfo noteInfo) async {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    await block.refreshItemAndSetAsCurrent(item: noteInfo, navigate: null);
  }

  Future<void> _onEditNoteBtnPressed(
    BuildContext context,
    NoteInfo noteInfo,
  ) async {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    await showNote42aInputDialog(context, note42aBlock: block, note: noteInfo);
  }
}
