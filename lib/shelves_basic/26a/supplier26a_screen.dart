import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import '../../widgets/short_desc_view.dart';
import 'block/supplier26a_block.dart';
import 'block_items_view/supplier26a_list_items_view.dart';
import 'block_section_view/supplier26a_buttons.dart';
import 'form_model/supplier26a_form_model.dart';
import 'form_view/supplier26a_form_view.dart';
import 'shelf/supplier26a_shelf.dart';

class Supplier26aScreen extends MyFaceScreen {
  static const String routeName = "/supplier26a";

  const Supplier26aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Supplier26aShelf shelf = FlutterArtist.storage.findShelf();
    Supplier26aBlock supplier26aBlock = shelf.findSupplier26aBlock();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LeftRightContainer(
        spacing: 20,
        arrowTopPosition: 35,
        fixedSizeWidth: 300,
        minSideWidth: 320,

        autoShowTwoSidesIfPossible: true,
        start: _buildLeft(supplier26aBlock),
        end: _buildRight(supplier26aBlock),
      ),
    );
  }

  Widget _buildLeft(Supplier26aBlock supplier26aBlock) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 300,
          child: Supplier26aListItemsView(block: supplier26aBlock),
        ),
        const SizedBox(height: 10),
        Supplier26aButtons(block: supplier26aBlock),
      ],
    );
  }

  Widget _buildRight(Supplier26aBlock supplier26aBlock) {
    var supplier26aFormModel =
        supplier26aBlock.formModel as Supplier26aFormModel;
    //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExampleOverviewBar(example: example_supplier26a),
        SizedBox(height: 10),
        const ShortDescView(
          shortDesc:
              "Patch the Form with the FormModel.patchFormFields() method.",
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlockControlBar(
                  description: null,
                  ownerClassInstance: this,
                  block: supplier26aBlock,
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
                Supplier26aFormView(formModel: supplier26aFormModel),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Form] Supplier26a";
  }

  @override
  String getTopMenuSubtitle() {
    return "Using FormInput";
  }
}
