import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/employment_history_rest_provider.dart';

class EmploymentHistory36aBlock
    extends
        Block<
          int, //
          EmploymentHistoryInfo,
          EmploymentHistoryData,
          EmptyFilterInput,
          EmptyFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const blkName = "employment-history36a-block";

  final employmentHistoryRestProvider = EmploymentHistoryRestProvider();

  EmploymentHistory36aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  Future<ApiResult<PageData<EmploymentHistoryInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required EmptyFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    EmployeeInfo employeeInfo = parentBlockCurrentItem as EmployeeInfo;
    //
    return await employmentHistoryRestProvider.query(
      pageable: pageable,
      employeeId: employeeInfo.id,
    );
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required int itemId}) async {
    return await employmentHistoryRestProvider.delete(itemId);
  }

  @override
  Future<ApiResult<EmploymentHistoryData>> performLoadItemDetailById({
    required int itemId,
  }) async {
    return await employmentHistoryRestProvider.find(
      employmentHistoryId: itemId,
    );
  }

  @override
  EmploymentHistoryInfo convertItemDetailToItem({
    required EmploymentHistoryData itemDetail,
  }) {
    return itemDetail.toEmploymentHistoryInfo();
  }

  @override
  Object extractParentBlockItemId({
    required EmploymentHistoryInfo fromThisBlockItem,
  }) {
    throw FeatureUnsupportedException(
      "Not Care!, See the document for details",
    );
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required EmptyFilterCriteria filterCriteria,
    required EmploymentHistoryData itemDetail,
  }) {
    return true;
  }

  @override
  EmptyFormInput buildInputForCreationForm({
    required Object? parentBlockCurrentItem,
    required EmptyFilterCriteria filterCriteria,
  }) {
    return EmptyFormInput();
  }

  @override
  Future<EmptyFormRelatedData> performLoadFormRelatedData({
    required Object? parentBlockCurrentItem,
    required EmploymentHistoryData? currentItemDetail,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
