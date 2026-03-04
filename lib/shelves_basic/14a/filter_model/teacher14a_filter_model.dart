import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/rest_provider/university_rest_provider.dart';

import '../../../model/model.dart';
import '../filter_criteria/teacher14a_filter_criteria.dart';

class Teacher14aFilterModel
    extends
        FilterModel<
          EmptyFilterInput, //
          Teacher14aFilterCriteria
        > {
  static const String filterName = "teacher14a-filter-model";

  final _provider = UniversityRestProvider();

  @override
  FilterModelStructure defineFilterModelStructure() {
    return FilterModelStructure(
      criteriaStructure: FilterCriteriaStructure(
        simpleCriterionDefs: [
          SimpleFilterCriterionDef<String>(criterionBaseName: "searchText"),
        ],
        multiOptCriterionDefs: [
          MultiOptFilterCriterionDef<UniversityInfo>.singleSelection(
            criterionBaseName: "university",
            fieldName: 'universityId',
            toFieldValue: (UniversityInfo? rawValue) {
              return SimpleVal.ofInt(rawValue?.id);
            },
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
            tildeCriterionName: "university~",
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
    if (multiOptTildeCriterionName == "university~") {
      ApiResult<UniversityInfoPage> result = await _provider.allUniversities();
      // IMPORTANT:
      result.throwIfError();
      // IMPORTANT: Generics should be declared explicitly.
      return ListXData<int, UniversityInfo>.fromPageData(
        pageData: result.data,
        getItemId: (item) => item.id,
      );
    }
    //
    return null;
  }

  @override
  Teacher14aFilterCriteria createNewFilterCriteria({
    required Map<String, dynamic> tildeCriteriaMap,
  }) {
    return Teacher14aFilterCriteria(
      university: tildeCriteriaMap["university~"],
      searchText: tildeCriteriaMap["searchText~"],
    );
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
    // TODO: implement filterInputToOptPropValue
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
}
