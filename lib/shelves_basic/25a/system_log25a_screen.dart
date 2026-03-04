import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import '../../widgets/short_desc_view.dart';
import 'block/system_log25a_block.dart';
import 'block_items_view/system_log25a_davi_table_items_view.dart';
import 'block_section_view/system_log25a_buttons.dart';
import 'shelf/system_log25a_shelf.dart';

class SystemLog25aScreen extends MyFaceScreen {
  static const String routeName = "/system-log-25a";

  const SystemLog25aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    SystemLog25aShelf shelf = FlutterArtist.storage.findShelf();
    SystemLog25aBlock systemLog25aBlock = shelf.findSystemLog25aBlock();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LeftRightContainer(
        spacing: 20,
        arrowTopPosition: 35,
        fixedSizeWidth: 260,
        minSideWidth: 320,

        autoShowTwoSidesIfPossible: true,
        start: _buildLeft(systemLog25aBlock),
        end: _buildRight(systemLog25aBlock),
      ),
    );
  }

  Widget _buildLeft(SystemLog25aBlock systemLog25aBlock) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [SystemLog25aButtons(block: systemLog25aBlock)],
    );
  }

  Widget _buildRight(SystemLog25aBlock systemLog25aBlock) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExampleOverviewBar(example: example_system_log25a),
        SizedBox(height: 10),
        const ShortDescView(
          shortDesc: 'Using BlockQuickMultiItemCreationAction',
        ),
        const SizedBox(height: 10),
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: systemLog25aBlock,
          config: BlockControlBarConfig(
            allowRefreshButton: true,
            allowQueryButton: true,
            allowCreateButton: true,
            allowSaveButton: true,
            allowDeleteButton: true,
            allowBackButton: false,
            allowDebugFormModelViewerButton: true,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: SystemLog25aDaviTableItemsView(block: systemLog25aBlock),
          ),
        ),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Action] SystemLog25a";
  }

  @override
  String getTopMenuSubtitle() {
    return "BlockQuickMultiItemCreationAction";
  }
}
