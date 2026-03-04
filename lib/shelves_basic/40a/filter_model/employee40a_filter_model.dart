import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/company_rest_provider.dart';
import '../../../rest_provider/department_rest_provider.dart';
import '../filter_criteria/employee40a_filter_criteria.dart';
import '../filter_input/employee40a_filter_input.dart';

class Employee40aFilterModel
    extends
        FilterModel<
          Employee40aFilterInput, //
          Employee40aFilterCriteria
        > {
  static const String filterName = "employee40a-filter-model";

  final _companyRestProvider = CompanyRestProvider();
  final _departmentRestProvider = DepartmentRestProvider();

  @override
  FilterModelStructure defineFilterModelStructure() {
    return FilterModelStructure(
      criteriaStructure: FilterCriteriaStructure(
        simpleCriterionDefs: [
          SimpleFilterCriterionDef<String>(criterionBaseName: "searchText"),
        ],
        multiOptCriterionDefs: [
          // Multi Option Single Selection Criterion.
          MultiOptFilterCriterionDef<CompanyInfo>.singleSelection(
            criterionBaseName: "company",
            fieldName: 'companyId',
            toFieldValue: (CompanyInfo? rawValue) {
              return SimpleVal.ofInt(rawValue?.id);
            },
            children: [
              // Multi Option Multi Selection Criterion.
              MultiOptFilterCriterionDef<DepartmentInfo>.multiSelection(
                criterionBaseName: "departments",
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
            tildeCriterionName: "departments~",
            operator: FilterOperator.inCollection,
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
    required Employee40aFilterInput? filterInput,
  }) async {
    // Company:
    if (multiOptTildeCriterionName == "company~") {
      // ApiResult<PageData<CompanyInfo>>
      ApiResult<CompanyInfoPage> result = await _companyRestProvider.queryAll();
      // IMPORTANT: Throw ApiError if Error.
      result.throwIfError();
      //
      return ListXData<int, CompanyInfo>.fromPageData(
        pageData: result.data,
        getItemId: (item) => item.id,
      );
    }
    // Department:
    else if (multiOptTildeCriterionName == "departments~") {
      // Because "departments" is child of "company"
      // Therefore, the parentMultiOptTildeCriterionValue is guaranteed to be non-null.
      CompanyInfo company = parentMultiOptTildeCriterionValue as CompanyInfo;
      // ApiResult<PageData<DepartmentInfo>>
      ApiResult<DepartmentInfoPage> result = await _departmentRestProvider
          .queryAllByCompanyId(companyId: company.id);
      // IMPORTANT: Throw ApiError if Error.
      result.throwIfError();
      //
      return ListXData<int, DepartmentInfo>.fromPageData(
        pageData: result.data,
        getItemId: (item) => item.id,
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
    required Employee40aFilterInput filterInput,
  }) {
    // Company:
    if (multiOptTildeCriterionName == "company~") {
      var listXData =
          multiOptTildeCriterionXData as ListXData<int, CompanyInfo>;
      CompanyInfo? companyInfo = listXData.data.firstWhere(
        (c) => c.code == filterInput.companyCode,
      );
      //
      return OptValueWrap.single(companyInfo);
    }
    // Department:
    else if (multiOptTildeCriterionName == "departments~") {
      var listXData =
          multiOptTildeCriterionXData as ListXData<int, DepartmentInfo>;
      List<DepartmentInfo>? departmentInfos = listXData.data
          .where((d) => filterInput.departmentCodes.contains(d.code))
          .toList();
      //
      return OptValueWrap.multi(departmentInfos);
    }
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
  Map<String, SimpleValueWrap?>? extractUpdateValuesForSimpleTildeCriteria({
    required Employee40aFilterInput filterInput,
  }) {
    return {"searchText~": SimpleValueWrap(filterInput.searchText)};
  }

  @override
  Employee40aFilterCriteria createNewFilterCriteria({
    required Map<String, dynamic> tildeCriteriaMap,
  }) {
    return Employee40aFilterCriteria(
      searchText: tildeCriteriaMap["searchText~"], // String?
      company: tildeCriteriaMap["company~"], // CompanyInfo?
      departments: tildeCriteriaMap["department~"], // DepartmentInfo?
    );
  }
}
