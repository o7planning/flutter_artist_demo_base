import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';

import '../../../model/model.dart';
import '../../../widgets/custom_app_container.dart';
import '../filter_model/teacher14a_filter_model.dart';

class Teacher14aFilterPanel extends FilterPanel<Teacher14aFilterModel> {
  const Teacher14aFilterPanel({super.key, required super.filterModel});

  @override
  Widget buildContent(BuildContext context) {
    return CustomAppContainer(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          FaFormBuilderTextField.topLabel(
            name: "searchText~",
            labelText: "Search Text",
            maxLines: 1,
            onChanged: (_) {
              _queryTeacher14a();
            },
          ),
          SizedBox(height: 5),
          FaFormBuilderDeselectableDropdown<UniversityInfo>.topLabel(
            name: "university~",
            labelText: "University",
            items:
                filterModel.getMultiOptTildeCriterionData("university~") ?? [],
            getItemText: (item) => item.name,
            onChanged: (_) {
              _queryTeacher14a();
            },
          ),
          SizedBox(height: 5),
          TextButton(onPressed: _queryTeacher14a, child: Text("Search")),
        ],
      ),
    );
  }

  void _queryTeacher14a() {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    // Query all blocks or scalars using this filterModel.
    filterModel.queryAll();
  }
}
