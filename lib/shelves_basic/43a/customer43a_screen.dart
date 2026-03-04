import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import 'block/customer43a_block.dart';
import 'block_item_detail_view/customer43a_item_detail_view.dart';
import 'block_items_view/customer43a_davi_table_items_view.dart';
import 'shelf/customer43a_shelf.dart';

class Customer43aScreen extends MyFaceScreen {
  static const String routeName = "/customer43a";

  const Customer43aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Customer43aShelf shelf = FlutterArtist.storage.findShelf();
    Customer43aBlock customer43aBlock = shelf.findCustomer43aBlock();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExampleOverviewBar(example: example_customer43a),
          SizedBox(height: 10),
          Expanded(
            child: LeftRightContainer(
              spacing: 10,
              arrowTopPosition: 70,
              fixedSide: FixedSide.end,
              fixedSizeWidth: 280,
              minSideWidth: 320,

              autoShowTwoSidesIfPossible: true,
              start: _buildLeft(customer43aBlock),
              end: _buildRight(customer43aBlock),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeft(Customer43aBlock customer43aBlock) {
    return Column(
      children: [
        //
        // BlockControlBar can automatically refresh when Block changes.
        //
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: customer43aBlock,
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
        Expanded(child: Customer43aDaviTableItemsView(block: customer43aBlock)),
      ],
    );
  }

  Widget _buildRight(Customer43aBlock customer43aBlock) {
    return Customer43aItemDetailView(block: customer43aBlock);
  }

  @override
  String getTopMenuTitle() {
    return "[Action] Customer43a";
  }

  @override
  String getTopMenuSubtitle() {
    return "BlockQuickItemUpdateAction";
  }
}
