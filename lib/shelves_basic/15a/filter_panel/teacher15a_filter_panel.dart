import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';

import '../../../model/model.dart';
import '../../../widgets/custom_app_container.dart';
import '../filter_model/teacher15a_filter_model.dart';

class Teacher15aFilterPanel extends FilterPanel<Teacher15aFilterModel> {
  const Teacher15aFilterPanel({super.key, required super.filterModel});

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
              _queryTeacher15a();
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
              _queryTeacher15a();
            },
          ),
          SizedBox(height: 5),
          TextButton(onPressed: _queryTeacher15a, child: Text("Search")),
        ],
      ),
    );
  }

  Future<void> _queryTeacher15a() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    // Query all blocks or scalars using this filterModel.
    await filterModel.queryAll();
  }
}
