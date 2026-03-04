import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import 'block/employee59a_block.dart';
import 'block_items_view/employee59a_davi_table_items_view.dart';
import 'filter_model/employee59a_filter_model.dart';
import 'filter_panel/employee59a_filter_panel.dart';
import 'shelf/employee59a_shelf.dart';

class Employee59aScreen extends MyFaceScreen {
  static const String routeName = "/employee59a";

  const Employee59aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Employee59aShelf shelf = FlutterArtist.storage.findShelf();
    Employee59aBlock employee59aBlock = shelf.findEmployee59aBlock();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LeftRightContainer(
        fixedSizeWidth: 360,
        minSideWidth: 300,
        fixedSide: FixedSide.end,
        spacing: 20,
        end: _buildRight(employee59aBlock),
        start: _buildLeft(employee59aBlock),
      ),
    );
  }

  Widget _buildLeft(Employee59aBlock employee59aBlock) {
    return Column(
      children: [
        ExampleOverviewBar(example: example_employee59a),
        SizedBox(height: 10),
        Employee59aFilterPanel(
          filterModel: employee59aBlock.filterModel as Employee59aFilterModel,
        ),
      ],
    );
  }

  Widget _buildRight(Employee59aBlock employee59aBlock) {
    return Column(
      children: [
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: employee59aBlock,
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
        Expanded(child: Employee59aDaviTableItemsView(block: employee59aBlock)),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Filter] Employee59a";
  }

  @override
  String getTopMenuSubtitle() {
    return "Advanced FilterModel";
  }
}
