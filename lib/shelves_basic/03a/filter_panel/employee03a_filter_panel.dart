import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';

import '../../../model/model.dart';
import '../filter_model/employee03a_filter_model.dart';

class Employee03aFilterPanel extends FilterPanel<Employee03aFilterModel> {
  const Employee03aFilterPanel({required super.filterModel, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFilterBar(context),
        Divider(),
        FaFormBuilderTextField.topLabel(
          name: "searchText~",
          labelText: "Search Text",
          maxLines: 1,
          onChanged: (_) async {
            await _queryEmployee03a();
          },
        ),
        SizedBox(height: 10),
        FaFormBuilderDeselectableDropdown<CompanyInfo>.topLabel(
          name: "company~",
          labelText: "Company",
          items: filterModel.getMultiOptTildeCriterionData("company~") ?? [],
          getItemText: (item) => item.name,
          onChanged: (_) async {
            await _queryEmployee03a();
          },
        ),
        SizedBox(height: 10),
        FaFormBuilderDeselectableDropdown<DepartmentInfo>.topLabel(
          name: "department~",
          labelText: "Department",
          items: filterModel.getMultiOptTildeCriterionData("department~") ?? [],
          getItemText: (item) => item.name,
          onChanged: (_) async {
            await _queryEmployee03a();
          },
        ),
      ],
    );
  }

  Future<void> _queryEmployee03a() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    await filterModel.queryAll();
  }
}
