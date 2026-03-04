import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_artist_demo_base/widgets/short_desc_view.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import 'block/country48a_block.dart';
import 'block_item_detail_view/country48a_item_detail_view.dart';
import 'block_items_view/country48a_list_items_view.dart';
import 'shelf/country48a_shelf.dart';

class Country48aScreen extends MyFaceScreen {
  static const String routeName = "/country48a";

  const Country48aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Country48aShelf shelf = FlutterArtist.storage.findShelf();
    Country48aBlock country48aBlock = shelf.findCountry48aBlock();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LeftRightContainer(
        spacing: 20,
        arrowTopPosition: 65,
        fixedSizeWidth: 260,
        minSideWidth: 320,
        autoShowTwoSidesIfPossible: true,
        start: _buildLeft(country48aBlock),
        end: _buildRight(country48aBlock),
      ),
    );
  }

  Widget _buildLeft(Country48aBlock country48aBlock) {
    return Country48aListItemsView(block: country48aBlock);
  }

  Widget _buildRight(Country48aBlock country48aBlock) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExampleOverviewBar(example: example_country48a),
        SizedBox(height: 10),
        ShortDescView(shortDesc: "ListView with Infinite Scroll Pagination"),
        SizedBox(height: 10),
        //
        // BlockControlBar can automatically refresh when Block changes.
        //
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: country48aBlock,
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
                Country48aItemDetailView(block: country48aBlock),
                SizedBox(height: 10),
                DebugBlockStateView(
                  block: country48aBlock,
                  vertical: false,
                  debugBlockOptions: DebugBlockOptions.custom(
                    showItemCount: true,
                  ),
                  debugFormOptions: null,
                  debugPaginationOptions: DebugPaginationOptions(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Pagination] Country48a";
  }

  @override
  String getTopMenuSubtitle() {
    return "ListView with Infinite Scroll Pagination";
  }
}
