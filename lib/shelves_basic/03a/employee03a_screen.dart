import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import 'block/employee03a_block.dart';
import 'block_items_view/employee03a_davi_table_items_view.dart';
import 'filter_model/employee03a_filter_model.dart';
import 'filter_panel/employee03a_filter_panel.dart';
import 'shelf/employee03a_shelf.dart';

class Employee03aScreen extends MyFaceScreen {
  static const String routeName = "/employee03a";

  const Employee03aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Employee03aShelf shelf = FlutterArtist.storage.findShelf();
    Employee03aBlock employee03aBlock = shelf.findEmployee03aBlock();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LeftRightContainer(
        fixedSizeWidth: 230,
        minSideWidth: 300,
        spacing: 20,
        end: _buildRight(employee03aBlock),
        start: _buildLeft(employee03aBlock),
      ),
    );
  }

  Widget _buildLeft(Employee03aBlock employee03aBlock) {
    return Employee03aFilterPanel(
      filterModel: employee03aBlock.filterModel as Employee03aFilterModel,
    );
  }

  Widget _buildRight(Employee03aBlock employee03aBlock) {
    return Column(
      children: [
        ExampleOverviewBar(example: example_employee03a),
        SizedBox(height: 10),
        //
        // BlockControlBar can automatically refresh when Block changes.
        //
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: employee03aBlock,
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
        Expanded(child: Employee03aDaviTableItemsView(block: employee03aBlock)),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Filter] Employee03a";
  }

  @override
  String getTopMenuSubtitle() {
    return "Using FilterModel";
  }
}
