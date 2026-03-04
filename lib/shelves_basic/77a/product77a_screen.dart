import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import 'block/product77a_block.dart';
import 'block_items_view/product77a_davi_table_items_view.dart';
import 'filter_model/product77a_filter_model.dart';
import 'filter_panel/product77a_filter_panel.dart';
import 'shelf/product77a_shelf.dart';

class Product77aScreen extends MyFaceScreen {
  static const String routeName = "/product77a";

  const Product77aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Product77aShelf shelf = FlutterArtist.storage.findShelf();
    Product77aBlock product77aBlock = shelf.findProduct77aBlock();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LeftRightContainer(
        fixedSizeWidth: 360,
        minSideWidth: 300,
        fixedSide: FixedSide.end,
        spacing: 20,
        end: _buildRight(product77aBlock),
        start: _buildLeft(product77aBlock),
      ),
    );
  }

  Widget _buildLeft(Product77aBlock product77aBlock) {
    return Column(
      children: [
        ExampleOverviewBar(example: example_product77a),
        SizedBox(height: 10),
        Product77aFilterPanel(
          filterModel: product77aBlock.filterModel as Product77aFilterModel,
        ),
      ],
    );
  }

  Widget _buildRight(Product77aBlock product77aBlock) {
    return Column(
      children: [
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: product77aBlock,
          config: BlockControlBarConfig(
            allowRefreshButton: true,
            allowQueryButton: true,
            allowCreateButton: false,
            allowSaveButton: false,
            allowDeleteButton: false,
            allowBackButton: false,
            allowDebugFormModelViewerButton: false,
            allowDebugFilterCriteriaViewerButton: true,
          ),
        ),
        SizedBox(height: 10),
        Expanded(child: Product77aDaviTableItemsView(block: product77aBlock)),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Filter] Product77a";
  }

  @override
  String getTopMenuSubtitle() {
    return "Advanced FilterModel";
  }
}
