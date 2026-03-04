import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import 'block/currency01a_block.dart';
import 'block_item_detail_view/currency01a_item_detail_view.dart';
import 'block_items_view/currency01a_list_items_view.dart';
import 'block_section_view/currency01a_nav_section_view.dart';
import 'shelf/currency01a_shelf.dart';

class Currency01aScreen extends MyFaceScreen {
  static const String routeName = "/currency01a";

  const Currency01aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Currency01aShelf shelf = FlutterArtist.storage.findShelf();
    Currency01aBlock currency01aBlock = shelf.findCurrency01aBlock();

    return LeftRightContainer(
      startPadding: const EdgeInsets.all(5),
      endPadding: const EdgeInsets.all(5),
      spacing: 20,
      arrowTopPosition: 65,
      fixedSizeWidth: 260,
      minSideWidth: 320,
      autoShowTwoSidesIfPossible: true,
      start: _buildLeft(currency01aBlock),
      end: _buildRight(currency01aBlock),
    );
  }

  Widget _buildLeft(Currency01aBlock currency01aBlock) {
    return Currency01aListItemsView(block: currency01aBlock);
  }

  Widget _buildRight(Currency01aBlock currency01aBlock) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExampleOverviewBar(example: example_currency01a),
        SizedBox(height: 10),
        //
        // BlockControlBar can automatically refresh when Block changes.
        //
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: currency01aBlock,
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
                Currency01aItemDetailView(block: currency01aBlock),
                SizedBox(height: 10),
                Currency01aNavSectionView(block: currency01aBlock),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Basic] Currency01a";
  }

  @override
  String getTopMenuSubtitle() {
    return "Hello World Example";
  }
}
