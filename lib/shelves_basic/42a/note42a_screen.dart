import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import '../../widgets/short_desc_view.dart';
import 'block/note42a_block.dart';
import 'block_items_view/note42a_staggered_grid_items_view.dart';
import 'dialog/note42a_input_dialog.dart';
import 'shelf/note42a_shelf.dart';

class Note42aScreen extends MyFaceScreen {
  static const String routeName = "/note42a";

  const Note42aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Note42aShelf shelf = FlutterArtist.storage.findShelf();
    Note42aBlock note42aBlock = shelf.findNote42aBlock();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExampleOverviewBar(example: example_note42a),
          SizedBox(height: 10),
          ShortDescView(
            shortDesc:
                'Using BlockQuickItemCreationAction and BlockQuickItemUpdateAction',
          ),
          SizedBox(height: 10),
          //
          // BlockControlBar can automatically refresh when Block changes.
          //
          BlockControlBar(
            description: null,
            ownerClassInstance: this,
            block: note42aBlock,
            config: BlockControlBarConfig(
              allowRefreshButton: true,
              allowQueryButton: true,
              allowCreateButton: false,
              allowSaveButton: false,
              allowDeleteButton: true,
              allowBackButton: false,
              allowDebugFormModelViewerButton: false,
              allowDebugFilterCriteriaViewerButton: true,
            ),
          ),
          SizedBox(height: 10),
          Expanded(child: Note42aStaggeredGridItemsView(block: note42aBlock)),
        ],
      ),
    );
  }

  @override
  Widget? buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      tooltip: 'Create a Note',
      onPressed: () async {
        await _createNewNote(context);
      },
      child: const Icon(Icons.add, color: Colors.white, size: 20),
    );
  }

  Future<void> _createNewNote(BuildContext context) async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    Note42aShelf shelf = FlutterArtist.storage.findShelf();
    Note42aBlock note42aBlock = shelf.findNote42aBlock();
    //
    await showNote42aInputDialog(
      context,
      note42aBlock: note42aBlock,
      note: null,
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Action] Note42a";
  }

  @override
  String getTopMenuSubtitle() {
    return "BlockQuickItemCreationAction, BlockQuickItemUpdateAction";
  }
}
