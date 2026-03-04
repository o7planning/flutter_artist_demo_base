import 'package:flutter_artist/flutter_artist.dart';

import '../filter_criteria/single_department_filter_criteria.dart';
import '../filter_input/single_department_filter_input.dart';

///
/// For FilterModel(s) that have only one property,
/// you can use one of the following built-in FilterModel(s):
///
/// [StringIdFilterModel],
/// [StringValueFilterModel]
/// [SearchTextFilterModel]
/// [IntIdFilterModel].
///
/// For Demo reasons we will write our own FilterModel.
///
class SingleDepartmentFilterModel
    extends
        FilterModel<
          SingleDepartmentFilterInput,
          SingleDepartmentFilterCriteria
        > {
  static const String flrName = "single-department-filter-model";

  //
  int? departmentId;

  @override
  FilterModelStructure defineFilterModelStructure() {
    return FilterModelStructure(
      criteriaStructure: FilterCriteriaStructure(
        simpleCriterionDefs: [],
        multiOptCriterionDefs: [],
      ),
      conditionStructure: FilterConditionStructure(
        connector: FilterConnector.and,
        conditionDefs: [],
      ),
    );
  }

  @override
  Future<XData?> performLoadMultiOptTildeCriterionXData({
    required String multiOptTildeCriterionName,
    required String multiOptCriterionBaseName,
    required Object? parentMultiOptTildeCriterionValue,
    required SelectionType selectionType,
    required SingleDepartmentFilterInput? filterInput,
  }) async {
    return null;
  }

  @override
  OptValueWrap? extractUpdateValueForMultiOptTildeCriterion({
    required String multiOptTildeCriterionName,
    required String multiOptCriterionBaseName,
    required Object? parentMultiOptTildeCriterionValue,
    required SelectionType selectionType,
    required XData multiOptTildeCriterionXData,
    required SingleDepartmentFilterInput filterInput,
  }) {
    // TODO: implement filterInputToOptPropValue
    throw UnimplementedError();
  }

  @override
  SingleDepartmentFilterCriteria createNewFilterCriteria({
    required Map<String, dynamic> tildeCriteriaMap,
  }) {
    return SingleDepartmentFilterCriteria(departmentId: departmentId);
  }

  @override
  Map<String, SimpleValueWrap?>? extractUpdateValuesForSimpleTildeCriteria({
    required SingleDepartmentFilterInput filterInput,
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
}
