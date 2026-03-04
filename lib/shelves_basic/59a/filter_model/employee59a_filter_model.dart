import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/company_rest_provider.dart';
import '../../../rest_provider/department_rest_provider.dart';
import '../filter_criteria/employee59a_filter_criteria.dart';

class Employee59aFilterModel
    extends FilterModel<EmptyFilterInput, Employee59aFilterCriteria> {
  static const String filterName = "employee59a-filter-model";

  final _companyProvider = CompanyRestProvider();
  final _departmentProvider = DepartmentRestProvider();

  @override
  FilterModelStructure defineFilterModelStructure() {
    return FilterModelStructure(
      criteriaStructure: FilterCriteriaStructure(
        simpleCriterionDefs: [
          SimpleFilterCriterionDef<String>(criterionBaseName: "searchText"),
        ],
        multiOptCriterionDefs: [
          // Multi Options Single Selection Criterion.
          MultiOptFilterCriterionDef<CompanyInfo>.singleSelection(
            criterionBaseName: "company",
            fieldName: 'companyId',
            toFieldValue: (CompanyInfo? rawValue) {
              return SimpleVal.ofInt(rawValue?.id);
            },
            children: [
              // Multi Options Single Selection Criterion.
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
          FilterConditionDef.group(
            groupName: 'G2',
            connector: FilterConnector.or,
            conditionDefs: [
              FilterConditionDef.simple(
                tildeCriterionName: "department~1",
                operator: FilterOperator.equalTo,
              ),
              FilterConditionDef.simple(
                tildeCriterionName: "department~2",
                operator: FilterOperator.equalTo,
              ),
            ],
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
    if (multiOptCriterionBaseName == "company") {
      // ApiResult<PageData<CompanyInfo>>
      ApiResult<CompanyInfoPage> result = await _companyProvider.queryAll();
      // IMPORTANT: Throw ApiError.
      result.throwIfError();
      // IMPORTANT: Generics should be declared explicitly.
      var companyListXData = ListXData<int, CompanyInfo>.fromPageData(
        pageData: result.data,
        getItemId: (item) => item.id,
      );
      return companyListXData;
    } else if (multiOptCriterionBaseName == "department") {
      //
      // Because "department" is child of "company".
      // So [parentMultiOptTildeCriterionValue] value is definitely non-null,
      // this guaranteed by the library.
      //
      CompanyInfo companyInfo =
          parentMultiOptTildeCriterionValue as CompanyInfo;
      // ApiResult<PageData<DepartmentInfo>>
      ApiResult<DepartmentInfoPage> result = await _departmentProvider
          .queryAllByCompanyId(companyId: companyInfo.id);
      // IMPORTANT: Throw ApiError if API Error.
      result.throwIfError();
      // IMPORTANT: Generics should be declared explicitly.
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
    required EmptyFilterInput filterInput,
  }) {
    throw UnimplementedError();
  }

  @override
  Map<String, SimpleValueWrap?>? extractUpdateValuesForSimpleTildeCriteria({
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
  Employee59aFilterCriteria createNewFilterCriteria({
    required Map<String, dynamic> tildeCriteriaMap,
  }) {
    return Employee59aFilterCriteria();
  }
}
