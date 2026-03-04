import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import '../../widgets/short_desc_view.dart';
import 'block/employee33a_block.dart';
import 'block_items_view/employee33a_davi_table_items_view.dart';
import 'filter_model/employee33a_filter_model.dart';
import 'filter_panel/employee33a_filter_panel.dart';
import 'shelf/employee33a_shelf.dart';

class Employee33aScreen extends MyFaceScreen {
  static const String routeName = "/employee33a";

  const Employee33aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Employee33aShelf shelf = FlutterArtist.storage.findShelf();
    Employee33aBlock employee33aBlock = shelf.findEmployee33aBlock();
    Employee33aFilterModel employee33aFilterModel = shelf
        .findEmployee33aFilterModel();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LeftRightContainer(
        spacing: 20,
        fixedSizeWidth: 230,
        minSideWidth: 300,
        end: _buildRight(employee33aBlock, employee33aFilterModel),
        start: _buildLeft(employee33aBlock),
      ),
    );
  }

  Widget _buildLeft(Employee33aBlock employee33aBlock) {
    return Employee33aFilterPanel(
      filterModel: employee33aBlock.filterModel as Employee33aFilterModel,
    );
  }

  Widget _buildRight(
    Employee33aBlock employee33aBlock,
    Employee33aFilterModel employee33aFilterModel,
  ) {
    return Column(
      children: [
        ExampleOverviewBar(example: example_employee33a),
        SizedBox(height: 10),
        ShortDescView(shortDesc: "Custom Tree in FilterPanel"),
        SizedBox(height: 10),
        //
        // BlockControlBar can automatically refresh when Block changes.
        //
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: employee33aBlock,
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
        const SizedBox(height: 10),
        Expanded(child: Employee33aDaviTableItemsView(block: employee33aBlock)),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Filter] Employee33a";
  }

  @override
  String getTopMenuSubtitle() {
    return "Advanced FilterModel, FilterPanel with FormBuilderField";
  }
}
