import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/rest_provider/album_rest_provider.dart';
import 'package:get/get.dart';

import '../../../model/model.dart';
import '../filter_criteria/song02a_filter_criteria.dart';

class Song02aFilterModel
    extends
        FilterModel<
          EmptyFilterInput, //
          Song02aFilterCriteria
        > {
  static const String filterName = "song02a-filter-model";

  final _albumRestProvider = AlbumRestProvider();

  @override
  FilterModelStructure defineFilterModelStructure() {
    return FilterModelStructure(
      criteriaStructure: FilterCriteriaStructure(
        simpleCriterionDefs: [
          SimpleFilterCriterionDef<String>(criterionBaseName: "searchText"),
        ],
        multiOptCriterionDefs: [
          // Multi Options Single Selection Criterion.
          MultiOptFilterCriterionDef<AlbumInfo>.singleSelection(
            criterionBaseName: "album",
            fieldName: 'albumId',
            toFieldValue: (AlbumInfo? rawValue) {
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
            tildeCriterionName: "album~",
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
    if (multiOptTildeCriterionName == "album~") {
      ApiResult<AlbumInfoPage> result = await _albumRestProvider.allAlbums();
      // Throw ApiError:
      result.throwIfError();
      // IMPORTANT: Generics should be declared explicitly.
      return ListXData<int, AlbumInfo>.fromPageData(
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
    // This simple example does not use FilterInput.
    return null;
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
    if (multiOptTildeCriterionName == "album~") {
      var listXData = multiOptTildeCriterionXData as ListXData<int, AlbumInfo>;
      AlbumInfo? album = listXData.data.firstOrNull;
      return OptValueWrap.single(album);
    }
    return null;
  }

  @override
  Map<String, dynamic>? specifyDefaultValuesForSimpleTildeCriteria() {
    return null;
  }

  @override
  Song02aFilterCriteria createNewFilterCriteria({
    required Map<String, dynamic> tildeCriteriaMap,
  }) {
    return Song02aFilterCriteria(
      album: tildeCriteriaMap["album~"], // AlbumInfo?
      searchText: tildeCriteriaMap["searchText~"], // String?
    );
  }
}
