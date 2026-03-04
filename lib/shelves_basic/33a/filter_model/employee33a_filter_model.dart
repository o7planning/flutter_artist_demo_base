import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/company_tree_rest_provider.dart';
import '../../../rest_provider/department_rest_provider.dart';
import '../filter_criteria/employee33a_filter_criteria.dart';

class Employee33aFilterModel
    extends FilterModel<EmptyFilterInput, Employee33aFilterCriteria> {
  static const String filterName = "employee33a-filter-model";

  final _companyTreeProvider = CompanyTreeRestProvider();
  final _departmentRestProvider = DepartmentRestProvider();

  ///
  /// ```dart
  ///  Map<String,dynamic> propMap = {
  ///    "searchText": "A String",
  ///    "company": Instance-of-CompanyTreeItem,
  ///    "department": Instance-of-DepartmentInfo,
  /// }
  /// ```
  @override
  FilterModelStructure defineFilterModelStructure() {
    return FilterModelStructure(
      criteriaStructure: FilterCriteriaStructure(
        simpleCriterionDefs: [
          SimpleFilterCriterionDef<String>(criterionBaseName: "searchText"),
        ],
        multiOptCriterionDefs: [
          MultiOptFilterCriterionDef<CompanyTreeItem>.singleSelection(
            criterionBaseName: "company",
            fieldName: 'companyId',
            toFieldValue: (CompanyTreeItem? rawValue) {
              return SimpleVal.ofInt(rawValue?.id);
            },
            children: [
              MultiOptFilterCriterionDef<DepartmentInfo>.singleSelection(
                criterionBaseName: "department",
                fieldName: 'departmentId',
                toFieldValue: (DepartmentInfo? rawValue) {
                  return SimpleVal.ofInt(rawValue?.id);
                },
              ),
            ],
          ),
        ],
      ),
      conditionStructure: FilterConditionStructure(
        connector: FilterConnector.and,
        conditionDefs: [
          FilterConditionDef.simple(
            tildeCriterionName: "searchText~",
            operator: FilterOperator.containsIgnoreCase,
          ),
          FilterConditionDef.simple(
            tildeCriterionName: "company~",
            operator: FilterOperator.equalTo,
          ),
          FilterConditionDef.simple(
            tildeCriterionName: "department~",
            operator: FilterOperator.equalTo,
          ),
        ],
      ),
    );
  }

  @override
  Future<XData?> performLoadMultiOptTildeCriterionXData({
    required String multiOptTildeCriterionName,
    required String multiOptCriterionBaseName,
    required Object? parentMultiOptTildeCriterionValue,
    required SelectionType selectionType,
    required EmptyFilterInput? filterInput,
  }) async {
    if (multiOptTildeCriterionName == "department~") {
      CompanyTreeItem company =
          parentMultiOptTildeCriterionValue as CompanyTreeItem;
      ApiResult<DepartmentInfoPage> result = await _departmentRestProvider
          .queryAllByCompanyId(companyId: company.id);
      result.throwIfError();
      //
      return ListXData<int, DepartmentInfo>.fromPageData(
        pageData: result.data,
        getItemId: (item) => item.id,
      );
    } else if (multiOptTildeCriterionName == "company~") {
      ApiResult<CompanyTree> result = await _companyTreeProvider
          .getCompanyTree();
      // Throw ApiError
      result.throwIfError();
      //
      CompanyTree? companyTree = result.data;
      if (companyTree == null) {
        return null;
      }
      return TreeXData<int, CompanyTreeItem, CompanyTree>(
        treeData: companyTree,
        getItemId: (item) => item.id,
        getRootTreeItems: () {
          return companyTree.rootCompanyTreeItems;
        },
        getChildren: (CompanyTreeItem item) {
          return item.children;
        },
        addNotFoundTreeItem: (CompanyTreeItem item) {
          companyTree.addNotFoundCompany(item);
        },
        removeNotFoundTreeItem: (CompanyTreeItem item) {
          companyTree.removeNotFoundCompany(item);
        },
      );
    }
    return null;
  }

  @override
  OptValueWrap? extractUpdateValueForMultiOptTildeCriterion({
    required String multiOptTildeCriterionName,
    required String multiOptCriterionBaseName,
    required Object? parentMultiOptTildeCriterionValue,
    required SelectionType selectionType,
    required XData multiOptTildeCriterionXData,
    required EmptyFilterInput filterInput,
  }) {
    return null;
  }

  @override
  OptValueWrap? specifyDefaultValueForMultiOptTildeCriterion({
    required String multiOptTildeCriterionName,
    required String multiOptCriterionBaseName,
    required Object? parentMultiOptTildeCriterionValue,
    required SelectionType selectionType,
    required XData multiOptTildeCriterionXData,
  }) {
    return null;
  }

  @override
  Map<String, dynamic>? specifyDefaultValuesForSimpleTildeCriteria() {
    return null;
  }

  @override
  Employee33aFilterCriteria createNewFilterCriteria({
    required Map<String, dynamic> tildeCriteriaMap,
  }) {
    return Employee33aFilterCriteria(
      searchText: tildeCriteriaMap["searchText~"],
      company: tildeCriteriaMap["company~"],
      department: tildeCriteriaMap["department~"],
    );
  }

  @override
  Map<String, SimpleValueWrap?>? extractUpdateValuesForSimpleTildeCriteria({
    required EmptyFilterInput filterInput,
  }) {
    return null;
  }
}
