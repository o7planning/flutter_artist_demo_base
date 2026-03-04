import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import '../../widgets/short_desc_view.dart';
import 'block/employee36a_block.dart';
import 'block/employment_history36a_block.dart';
import 'block_items_view/employee36a_list_items_view.dart';
import 'block_items_view/employment_history36a_list_items_view.dart';
import 'form_model/employment_history36a_form_model.dart';
import 'form_view/employment_history36a_form_view.dart';
import 'shelf/emp_employment_history36a_shelf.dart';

class EmpEmploymentHistory36aScreen extends MyFaceScreen {
  static const String routeName = "/emp-employment-history36a";

  const EmpEmploymentHistory36aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    EmpEmploymentHistory36aShelf shelf = FlutterArtist.storage.findShelf();
    var employee36aBlock = shelf.findEmployee36aBlock();
    var employmentHistory36aBlock = shelf.findEmploymentHistory36aBlock();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LeftRightContainer(
        spacing: 20,
        fixedSizeWidth: 260,
        minSideWidth: 300,
        end: _buildRight(employmentHistory36aBlock),
        start: _buildLeft(employee36aBlock, employmentHistory36aBlock),
      ),
    );
  }

  Widget _buildLeft(
    Employee36aBlock employee36aBlock,
    EmploymentHistory36aBlock employmentHistory36aBlock,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Employees:"),
        const SizedBox(height: 5),
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: employee36aBlock,
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
        const SizedBox(height: 5),
        SizedBox(
          height: 180,
          child: Employee36aListItemsView(block: employee36aBlock),
        ),
        Divider(),
        Text("Employment Histories:"),
        const SizedBox(height: 5),
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: employmentHistory36aBlock,
          config: BlockControlBarConfig(
            allowRefreshButton: true,
            allowQueryButton: true,
            allowCreateButton: false,
            allowSaveButton: false,
            allowDeleteButton: false,
            allowBackButton: false,
            allowDebugFormModelViewerButton: false,
            allowDebugFilterCriteriaViewerButton: false,
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: EmploymentHistory36aListItemsView(
            block: employmentHistory36aBlock,
          ),
        ),
      ],
    );
  }

  Widget _buildRight(EmploymentHistory36aBlock employmentHistory36aBlock) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExampleOverviewBar(example: example_empEmploymentHistory36a),
        SizedBox(height: 10),
        ShortDescView(
          shortDesc: "FilterModel with Parent-Child MultiOptProp(s)",
        ),
        const SizedBox(height: 10),
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: employmentHistory36aBlock,
          config: BlockControlBarConfig(
            allowRefreshButton: true,
            allowQueryButton: true,
            allowCreateButton: true,
            allowSaveButton: true,
            allowDeleteButton: true,
            allowBackButton: false,
            allowDebugFormModelViewerButton: true,
            allowDebugFilterCriteriaViewerButton: true,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: EmploymentHistory36aFormView(
              formModel:
                  employmentHistory36aBlock.formModel
                      as EmploymentHistory36aFormModel,
            ),
          ),
        ),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Form] EmpEmploymentHistory36a";
  }

  @override
  String getTopMenuSubtitle() {
    return "FormModel with Parent-Child MultiOptProp(s)";
  }
}
