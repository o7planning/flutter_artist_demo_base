import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';

import '../../../../model/model.dart';
import '../filter_model/employee40a_filter_model.dart';

class Employee40aFilterPanel extends FilterPanel<Employee40aFilterModel> {
  const Employee40aFilterPanel({required super.filterModel, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFilterBar(context),
        const Divider(),
        FaFormBuilderTextField(
          name: "searchText~",
          labelText: "Search Text",
          maxLines: 1,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          onChanged: _onSearchTextChanged,
        ),
        const SizedBox(height: 10),
        FaFormBuilderDeselectableDropdown<CompanyInfo>(
          key: const Key("filter-company"),
          name: "company~",
          labelText: "Company",
          items: filterModel.getMultiOptTildeCriterionData("company~") ?? [],
          getItemText: (item) => item.name,
          onChanged: _onSelectCompany,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        const SizedBox(height: 5),
        FaFormBuilderMultiDropdown<int, DepartmentInfo>.topLabel(
          key: const Key("filter-department"),
          name: "departments~",
          dropdownTitle: 'Select departments',
          labelText: "Department",
          items:
              filterModel.getMultiOptTildeCriterionData("departments~") ?? [],
          getItemText: (item) => item.name,
          onChanged: _onChangeDepartment,
        ),
      ],
    );
  }

  Future<void> _onSearchTextChanged(String? text) async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: {},
    );
    //
    await filterModel.queryAll();
  }

  Future<void> _onSelectCompany(CompanyInfo? company) async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: {"company": company},
    );
    //
    await filterModel.queryAll();
  }

  Future<void> _onChangeDepartment(List<DepartmentInfo>? departments) async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: {"departments": departments},
    );
    //
    await filterModel.queryAll();
  }
}
