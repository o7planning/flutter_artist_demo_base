import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import 'block/teacher14a_block.dart';
import 'block_items_view/teacher14a_grid_items_view.dart';
import 'filter_model/teacher14a_filter_model.dart';
import 'filter_panel/teacher14a_filter_panel.dart';
import 'shelf/teacher14a_shelf.dart';

class Teacher14aScreen extends MyFaceScreen {
  static const String routeName = "/teacher14a";

  const Teacher14aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Teacher14aShelf shelf = FlutterArtist.storage.findShelf();
    Teacher14aBlock teacher14aBlock = shelf.findTeacher14aBlock();
    Teacher14aFilterModel teacher14aFilterModel = shelf
        .findTeacher14aFilterModel();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: LeftRightContainer(
        spacing: 20,
        arrowTopPosition: 10,
        fixedSizeWidth: 260,
        minSideWidth: 320,
        autoShowTwoSidesIfPossible: true,
        start: _buildLeft(teacher14aFilterModel, teacher14aBlock),
        end: _buildRight(teacher14aBlock),
      ),
    );
  }

  Widget _buildRight(Teacher14aBlock teacher14aBlock) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExampleOverviewBar(example: example_teacher14a),
        SizedBox(height: 10),
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: teacher14aBlock,
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
        Expanded(child: Teacher14aGridItemsView(block: teacher14aBlock)),
        SizedBox(height: 10),
        BlockNumberPagination(
          block: teacher14aBlock,
          description: null,
          ownerClassInstance: this,
          visiblePagesCount: 10,
        ),
      ],
    );
  }

  Widget _buildLeft(
    Teacher14aFilterModel teacher14aFilterModel,
    Teacher14aBlock teacher14aBlock,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Teacher14aFilterPanel(filterModel: teacher14aFilterModel),
        SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: DebugBlockStateView(
              block: teacher14aBlock,
              vertical: false,
              debugBlockOptions: null,
              debugFormOptions: null,
              debugPaginationOptions: DebugPaginationOptions(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Pagination] Teacher14a";
  }

  @override
  String getTopMenuSubtitle() {
    return "BlockNumberPagination";
  }
}
