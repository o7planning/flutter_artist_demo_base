import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import 'block/teacher15a_block.dart';
import 'block_items_view/teacher15a_davi_table_items_view.dart';
import 'block_section_view/teacher15a_pageable_view.dart';
import 'block_section_view/teacher15a_pagination_ctrl.dart';
import 'block_section_view/teacher15a_pagination_info_view.dart';
import 'filter_model/teacher15a_filter_model.dart';
import 'filter_panel/teacher15a_filter_panel.dart';
import 'shelf/teacher15a_shelf.dart';

class Teacher15aScreen extends MyFaceScreen {
  static const String routeName = "/teacher15a";

  const Teacher15aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Teacher15aShelf shelf = FlutterArtist.storage.findShelf();
    Teacher15aBlock teacher15aBlock = shelf.findTeacher15aBlock();
    Teacher15aFilterModel teacher15aFilterModel = shelf
        .findTeacher15aFilterModel();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LeftRightContainer(
        spacing: 20,
        arrowTopPosition: 35,
        fixedSizeWidth: 260,
        minSideWidth: 320,
        autoShowTwoSidesIfPossible: true,
        start: _buildLeft(teacher15aFilterModel, teacher15aBlock),
        end: _buildRight(teacher15aBlock),
      ),
    );
  }

  Widget _buildRight(Teacher15aBlock teacher15aBlock) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExampleOverviewBar(example: example_teacher15a),
        SizedBox(height: 10),
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: teacher15aBlock,
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
        Expanded(child: Teacher15aDaviTableItemsView(block: teacher15aBlock)),
        SizedBox(height: 10),
        Teacher15aPaginationCtrl(block: teacher15aBlock),
      ],
    );
  }

  Widget _buildLeft(
    Teacher15aFilterModel teacher15aFilterModel,
    Teacher15aBlock teacher15aBlock,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Teacher15aFilterPanel(filterModel: teacher15aFilterModel),
        SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Teacher15aPageableView(block: teacher15aBlock),
                SizedBox(height: 10),
                Teacher15aPaginationInfoView(block: teacher15aBlock),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Pagination] Teacher15a";
  }

  @override
  String getTopMenuSubtitle() {
    return "Custom Pagination";
  }
}
