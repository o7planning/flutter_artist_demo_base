import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import '../../widgets/short_desc_view.dart';
import 'block/employee40a_block.dart';
import 'block_items_view/employee40a_davi_table_items_view.dart';
import 'block_section_view/employee40a_buttons.dart';
import 'filter_model/employee40a_filter_model.dart';
import 'filter_panel/employee40a_filter_panel.dart';
import 'shelf/employee40a_shelf.dart';

class Employee40aScreen extends MyFaceScreen {
  static const String routeName = "/employee40a";

  const Employee40aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Employee40aShelf shelf = FlutterArtist.storage.findShelf();
    Employee40aBlock employee40aBlock = shelf.findEmployee40aBlock();
    Employee40aFilterModel employee40aFilterModel = shelf
        .findEmployee40aFilterModel();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LeftRightContainer(
        spacing: 20,
        fixedSizeWidth: 280,
        minSideWidth: 300,
        end: _buildRight(employee40aBlock, employee40aFilterModel),
        start: _buildLeft(employee40aBlock),
      ),
    );
  }

  Widget _buildLeft(Employee40aBlock employee40aBlock) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Employee40aFilterPanel(
          filterModel: employee40aBlock.filterModel as Employee40aFilterModel,
        ),
        const Divider(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Employee40aButtons(block: employee40aBlock),
          ),
        ),
      ],
    );
  }

  Widget _buildRight(
    Employee40aBlock employee40aBlock,
    Employee40aFilterModel employee40aFilterModel,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExampleOverviewBar(example: example_employee40a),
        SizedBox(height: 10),
        ShortDescView(shortDesc: "Query with FilterInput"),
        const SizedBox(height: 10),
        //
        // BlockControlBar can automatically refresh when Block changes.
        //
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: employee40aBlock,
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
        Expanded(child: Employee40aDaviTableItemsView(block: employee40aBlock)),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Filter] Employee40a";
  }

  @override
  String getTopMenuSubtitle() {
    return "Filter with FilterInput and MultiDropdown";
  }
}
