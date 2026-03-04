import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../model/model.dart';
import '../../../widgets/company_tree_view.dart';
import '../filter_model/employee33a_filter_model.dart';

class Employee33aFilterPanel extends FilterPanel<Employee33aFilterModel> {
  const Employee33aFilterPanel({required super.filterModel, super.key});

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
          onChanged: (String? text) {
            _onSearchText33aChange(text);
          },
        ),
        SizedBox(
          height: 190,
          child: FormBuilderField<CompanyTreeItem>(
            key: const Key("filter-company"),
            name: "company~",
            builder: (FormFieldState<CompanyTreeItem> field) {
              return CompanyTreeView(
                companyTree: filterModel.getMultiOptTildeCriterionData(
                  "company~",
                ),
                selectedCompanyTreeItem: field.value,
                onSelectCompanyTreeItem: (CompanyTreeItem item) {
                  // IMPORTANT (If you using FormBuilderField):
                  field.didChange(item);
                  //
                  _onSelectCompanyTreeItem(item);
                },
              );
            },
          ),
        ),
        const SizedBox(height: 30),
        FaFormBuilderDeselectableDropdown<DepartmentInfo>(
          key: const Key("filter-department"),
          name: "department~",
          labelText: "Department",
          items: filterModel.getMultiOptTildeCriterionData("department~") ?? [],
          getItemText: (item) => item.name,
          onChanged: _onChangeDepartment,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ],
    );
  }

  Future<void> _onSearchText33aChange(String? searchText) async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: {"searchText": searchText},
    );
    //
    await filterModel.queryAll();
  }

  Future<void> _onSelectCompanyTreeItem(CompanyTreeItem treeItem) async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: {"treeItem": treeItem},
    );
    //
    await filterModel.queryAll();
  }

  Future<void> _onChangeDepartment(DepartmentInfo? department) async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: {"department": department},
    );
    //
    await filterModel.queryAll();
  }
}
