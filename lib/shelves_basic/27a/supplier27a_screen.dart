import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import '../../widgets/highlight_view.dart';
import '../../widgets/short_desc_view.dart';
import '../single_supplier/single_supplier_form_end_drawer.dart';
import 'block/supplier27a_block.dart';
import 'block_item_detail_view/supplier27a_item_detail_view.dart';
import 'block_items_view/supplier27a_list_items_view.dart';
import 'block_section_view/supplier27a_buttons.dart';
import 'shelf/supplier27a_shelf.dart';

class Supplier27aScreen extends MyFaceScreen {
  static const String routeName = "/supplier27a";

  const Supplier27aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Supplier27aShelf shelf = FlutterArtist.storage.findShelf();
    Supplier27aBlock supplier27aBlock = shelf.findSupplier27aBlock();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LeftRightContainer(
        spacing: 20,
        arrowTopPosition: 35,
        fixedSizeWidth: 280,
        minSideWidth: 320,
        autoShowTwoSidesIfPossible: true,
        start: _buildLeft(supplier27aBlock),
        end: _buildRight(supplier27aBlock),
      ),
    );
  }

  Widget _buildLeft(Supplier27aBlock supplier27aBlock) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HighlightView(
          text: "${getClassName(supplier27aBlock.shelf)} > (BlockItemsView)",
        ),
        SizedBox(height: 10),
        Expanded(child: Supplier27aListItemsView(block: supplier27aBlock)),
      ],
    );
  }

  Widget _buildRight(Supplier27aBlock supplier27aBlock) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExampleOverviewBar(example: example_supplier27a),
        SizedBox(height: 10),
        const ShortDescView(
          shortDesc: "Block-level reaction to External Shelf Events.",
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlockControlBar(
                  description: null,
                  ownerClassInstance: this,
                  block: supplier27aBlock,
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
                const SizedBox(height: 10),
                HighlightView(
                  text:
                      "${getClassName(supplier27aBlock.shelf)} > (BlockItemDetailView)",
                ),
                const SizedBox(height: 10),
                Supplier27aItemDetailView(block: supplier27aBlock),
                const SizedBox(height: 10),
                Supplier27aButtons(block: supplier27aBlock),
                SizedBox(height: 10),
                DebugBlockStateView(
                  block: supplier27aBlock,
                  vertical: false,
                  debugBlockOptions: DebugBlockOptions.custom(
                    showUiActive: true,
                    showBlockDataState: true,
                    showPerformQueryCount: true,
                    showPerformLoadItemCount: true,
                    showCurrentItemChangeCount: true,
                  ),
                  debugFormOptions: null,
                  debugPaginationOptions: null,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double calculateEndDrawerWidth(BuildContext context) {
    return 340;
  }

  @override
  Widget buildEndDrawer(BuildContext context) {
    return SingleSupplierFormEndDrawer();
  }

  @override
  String getTopMenuTitle() {
    return "[Event] Supplier27a";
  }

  @override
  String getTopMenuSubtitle() {
    return "External Shelf Event";
  }
}
