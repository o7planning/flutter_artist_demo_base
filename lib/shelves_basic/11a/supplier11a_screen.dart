import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import 'block/supplier11a_block.dart';
import 'block_items_view/supplier11a_list_items_view.dart';
import 'form_model/supplier11a_form_model.dart';
import 'form_view/supplier11a_form_view.dart';
import 'shelf/supplier11a_shelf.dart';

class Supplier11aScreen extends MyFaceScreen {
  static const String routeName = "/supplier11a";

  const Supplier11aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Supplier11aShelf shelf = FlutterArtist.storage.findShelf();
    Supplier11aBlock supplier11aBlock = shelf.findSupplier11aBlock();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LeftRightContainer(
        spacing: 20,
        arrowTopPosition: 35,
        fixedSizeWidth: 290,
        minSideWidth: 320,

        autoShowTwoSidesIfPossible: true,
        start: _buildLeft(supplier11aBlock),
        end: _buildRight(supplier11aBlock),
      ),
    );
  }

  Widget _buildLeft(Supplier11aBlock supplier11aBlock) {
    return Supplier11aListItemsView(block: supplier11aBlock);
  }

  Widget _buildRight(Supplier11aBlock supplier11aBlock) {
    var supplier11aFormModel =
        supplier11aBlock.formModel as Supplier11aFormModel;
    //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExampleOverviewBar(example: example_supplier11a),
        SizedBox(height: 10),
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: supplier11aBlock,
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
        SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Supplier11aFormView(formModel: supplier11aFormModel),
          ),
        ),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Form] Supplier11a";
  }

  @override
  String getTopMenuSubtitle() {
    return "Using FormModel";
  }
}
