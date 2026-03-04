import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';

import '../../../model/model.dart';
import '../filter_model/employee59a_filter_model.dart';

class Employee59aFilterPanel extends FilterPanel<Employee59aFilterModel> {
  const Employee59aFilterPanel({required super.filterModel, super.key});

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
            await _queryEmployee59a();
          },
        ),
        SizedBox(height: 10),
        Text("AND"),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.3),
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _buildCompanyDept1()),
              SizedBox(width: 5),
              Text("OR"),
              SizedBox(width: 5),
              Expanded(child: _buildCompanyDept2()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCompanyDept1() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.3),
        color: Colors.indigo.withAlpha(20),
      ),
      child: Column(
        children: [
          FaFormBuilderDeselectableDropdown<CompanyInfo>.topLabel(
            name: "company~1",
            labelText: "Company 1",
            items: filterModel.getMultiOptTildeCriterionData("company~1") ?? [],
            getItemText: (item) => item.name,
            onChanged: (_) async {
              await _queryEmployee59a();
            },
          ),
          SizedBox(height: 10),
          FaFormBuilderDeselectableDropdown<DepartmentInfo>.topLabel(
            name: "department~1",
            labelText: "Department 1",
            items:
                filterModel.getMultiOptTildeCriterionData("department~1") ?? [],
            getItemText: (item) => item.name,
            onChanged: (_) async {
              await _queryEmployee59a();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyDept2() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.3),
        color: Colors.indigo.withAlpha(20),
      ),
      child: Column(
        children: [
          FaFormBuilderDeselectableDropdown<CompanyInfo>.topLabel(
            name: "company~2",
            labelText: "Company 2",
            items: filterModel.getMultiOptTildeCriterionData("company~2") ?? [],
            getItemText: (item) => item.name,
            onChanged: (_) async {
              await _queryEmployee59a();
            },
          ),
          SizedBox(height: 10),
          FaFormBuilderDeselectableDropdown<DepartmentInfo>.topLabel(
            name: "department~2",
            labelText: "Department 2",
            items:
                filterModel.getMultiOptTildeCriterionData("department~2") ?? [],
            getItemText: (item) => item.name,
            onChanged: (_) async {
              await _queryEmployee59a();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _queryEmployee59a() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    await filterModel.queryAll();
  }
}
