import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import 'block/category08a_block.dart';
import 'block/product08a_block.dart';
import 'block_item_detail_view/category08a_item_detail_view.dart';
import 'block_items_view/category08a_list_items_view.dart';
import 'block_items_view/product08a_davi_table_items_view.dart';
import 'shelf/cat_product08a_shelf.dart';

class CatProduct08aScreen extends MyFaceScreen {
  static const String routeName = "/cat-product08a";

  const CatProduct08aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    CatProduct08aShelf shelf = FlutterArtist.storage.findShelf();
    Category08aBlock categoryBlock = shelf.findCategory08aBlock();
    Product08aBlock productBlock = shelf.findProduct08aBlock();

    return LeftRightContainer(
      startPadding: EdgeInsets.all(5),
      endPadding: EdgeInsets.all(5),
      spacing: 20,
      arrowTopPosition: 35,
      fixedSizeWidth: 240,
      minSideWidth: 320,
      autoShowTwoSidesIfPossible: true,
      start: _buildLeft(categoryBlock),
      end: _buildRight(categoryBlock, productBlock),
    );
  }

  Widget _buildLeft(Category08aBlock categoryBlock) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: categoryBlock,
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
        Expanded(child: Category08aListItemsView(block: categoryBlock)),
      ],
    );
  }

  Widget _buildRight(
    Category08aBlock categoryBlock,
    Product08aBlock productBlock,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExampleOverviewBar(example: example_catProduct08a),
        SizedBox(height: 10),
        Category08aItemDetailView(block: categoryBlock),
        SizedBox(height: 10),
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: productBlock,
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
        Expanded(child: Product08aDaviTableItemsView(block: productBlock)),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Basic] Categories & Products";
  }

  @override
  String getTopMenuSubtitle() {
    return "2 Levels Master-Details (Single Screen)";
  }
}
