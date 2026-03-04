import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import 'block/currency49a_block.dart';
import 'block_item_detail_view/currency49a_item_detail_view.dart';
import 'block_items_view/currency49a_reorderable_list_items_view.dart';
import 'block_section_view/currency49a_custom_item_navigation.dart';
import 'shelf/currency49a_shelf.dart';

class Currency49aScreen extends MyFaceScreen {
  static const String routeName = "/currency49a";

  const Currency49aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Currency49aShelf shelf = FlutterArtist.storage.findShelf();
    Currency49aBlock currency49aBlock = shelf.findCurrency49aBlock();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LeftRightContainer(
        spacing: 20,
        arrowTopPosition: 65,
        fixedSizeWidth: 260,
        minSideWidth: 320,
        autoShowTwoSidesIfPossible: true,
        start: _buildLeft(currency49aBlock),
        end: _buildRight(currency49aBlock),
      ),
    );
  }

  Widget _buildLeft(Currency49aBlock currency49aBlock) {
    return Currency49aReorderableListItemsView(block: currency49aBlock);
  }

  Widget _buildRight(Currency49aBlock currency49aBlock) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExampleOverviewBar(example: example_currency49a),
        SizedBox(height: 10),
        //
        // BlockControlBar can automatically refresh when Block changes.
        //
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: currency49aBlock,
          config: BlockControlBarConfig(
            allowRefreshButton: true,
            allowQueryButton: true,
            allowCreateButton: false,
            allowSaveButton: false,
            allowDeleteButton: false,
            allowBackButton: false,
            allowDebugFormModelViewerButton: false,
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Currency49aItemDetailView(block: currency49aBlock),
                SizedBox(height: 10),
                Currency49aCustomItemNavigation(block: currency49aBlock),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Sort] Currency49a";
  }

  @override
  String getTopMenuSubtitle() {
    return "Manual Sorting, ReorderableListView";
  }
}
