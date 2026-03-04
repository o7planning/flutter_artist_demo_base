import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import 'block/single_department_block.dart';
import 'form_model/single_department_form_model.dart';
import 'form_view/department_form.dart';
import 'shelf/single_department_shelf.dart';

class SingleDepartmentFormScreen extends StatelessWidget {
  const SingleDepartmentFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SingleDepartmentShelf shelf = FlutterArtist.storage.findShelf();
    SingleDepartmentBlock singleDepartmentBlock = shelf
        .findSingleDepartmentBlock();

    //
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlockControlBar(
          ownerClassInstance: this,
          description: null,
          block: singleDepartmentBlock,
          config: BlockControlBarConfig(
            allowRefreshButton: true,
            allowQueryButton: false,
            allowCreateButton: false,
            allowSaveButton: true,
            allowDeleteButton: false,
            allowBackButton: false,
            allowDebugFormModelViewerButton: true,
          ),
        ),
        SizedBox(height: 10),
        DepartmentFormView(
          formModel:
              singleDepartmentBlock.formModel as SingleDepartmentFormModel,
        ),
      ],
    );
  }
}
