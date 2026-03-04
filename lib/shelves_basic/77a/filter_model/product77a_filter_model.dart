import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/category_rest_provider.dart';
import '../filter_criteria/product77a_filter_criteria.dart';

class Product77aFilterModel
    extends FilterModel<EmptyFilterInput, Product77aFilterCriteria> {
  static const String filterName = "product77a-filter-model";

  final _categoryProvider = CategoryRestProvider();

  @override
  FilterModelStructure defineFilterModelStructure() {
    return FilterModelStructure(
      criteriaStructure: FilterCriteriaStructure(
        simpleCriterionDefs: [
          SimpleFilterCriterionDef<double>(criterionBaseName: "price"),
        ],
        multiOptCriterionDefs: [
          // Multi Options Single Selection Criterion.
          MultiOptFilterCriterionDef<CategoryInfo>.singleSelection(
            criterionBaseName: "category",
            fieldName: 'categoryId',
            toFieldValue: (CategoryInfo? rawValue) {
              return SimpleVal.ofInt(rawValue?.id);
            },
          ),
        ],
      ),
      conditionStructure: FilterConditionStructure(
        connector: FilterConnector.and,
        conditionDefs: [
          FilterConditionDef.simple(
            tildeCriterionName: "category~",
            operator: FilterOperator.equalTo,
          ),
          FilterConditionDef.simple(
            tildeCriterionName: "price~min",
            operator: FilterOperator.greaterThan,
          ),
          FilterConditionDef.simple(
            tildeCriterionName: "price~max",
            operator: FilterOperator.lessThan,
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
    if (multiOptCriterionBaseName == "category") {
      // ApiResult<PageData<CategoryInfo>>
      ApiResult<CategoryInfoPage> result = await _categoryProvider.queryAll();
      // IMPORTANT: Throw ApiError.
      result.throwIfError();
      // IMPORTANT: Generics should be declared explicitly.
      var categoryListXData = ListXData<int, CategoryInfo>.fromPageData(
        pageData: result.data,
        getItemId: (item) => item.id,
      );
      return categoryListXData;
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
    if (multiOptCriterionBaseName == "category") {
      var xList = multiOptTildeCriterionXData as ListXData<int, CategoryInfo>;
      final CategoryInfo? categoryInfo = xList.data.firstOrNull;
      return OptValueWrap.single(categoryInfo);
    }
    return null;
  }

  @override
  Map<String, dynamic>? specifyDefaultValuesForSimpleTildeCriteria() {
    return {"price~min": 1000, "price~max": 20000};
  }

  @override
  Product77aFilterCriteria createNewFilterCriteria({
    required Map<String, dynamic> tildeCriteriaMap,
  }) {
    return Product77aFilterCriteria();
  }
}
