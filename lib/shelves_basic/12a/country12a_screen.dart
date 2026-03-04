import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import 'block/country12a_block.dart';
import 'block_item_detail_view/country12a_item_detail_view.dart';
import 'block_items_view/country12a_davi_table_items_view.dart';
import 'section/country12a_client_side_sort_section.dart';
import 'section/country12a_server_side_sort_section.dart';
import 'shelf/country12a_shelf.dart';

class Country12aScreen extends MyFaceScreen {
  static const String routeName = "/country12a";

  const Country12aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Country12aShelf shelf = FlutterArtist.storage.findShelf();
    Country12aBlock country12aBlock = shelf.findCountry12aBlock();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExampleOverviewBar(example: example_country12a),
          SizedBox(height: 10),
          Expanded(
            child: LeftRightContainer(
              spacing: 20,
              arrowTopPosition: 70,
              fixedSide: FixedSide.end,
              fixedSizeWidth: 280,
              minSideWidth: 320,

              autoShowTwoSidesIfPossible: true,
              start: _buildLeft(country12aBlock),
              end: _buildRight(country12aBlock),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeft(Country12aBlock country12aBlock) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        // BlockControlBar can automatically refresh when Block changes.
        //
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: country12aBlock,
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
        if (country12aBlock.serverSideSortModel != null) SizedBox(height: 10),
        if (country12aBlock.serverSideSortModel != null) SizedBox(height: 10),
        Country12aServerSideSortSection(
          serverSideSortModel: country12aBlock.serverSideSortModel!,
        ),
        if (country12aBlock.clientSideSortModel != null) SizedBox(height: 10),
        if (country12aBlock.clientSideSortModel != null)
          Country12aClientSideSortSection(
            clientSideSortModel: country12aBlock.clientSideSortModel!,
          ),
        SizedBox(height: 10),
        Expanded(child: Country12aDaviTableItemsView(block: country12aBlock)),
      ],
    );
  }

  Widget _buildRight(Country12aBlock country12aBlock) {
    return Country12aItemDetailView(block: country12aBlock);
  }

  @override
  String getTopMenuTitle() {
    return "[Sort] Country12a";
  }

  @override
  String getTopMenuSubtitle() {
    return "Sorting, SortModel, DropdownSortPanel";
  }
}
