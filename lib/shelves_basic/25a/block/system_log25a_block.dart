import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/system_log_rest_provider.dart';

class SystemLog25aBlock
    extends
        Block<
          int, //
          SystemLogInfo,
          SystemLogData,
          EmptyFilterInput,
          EmptyFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const String blkName = "system-log25a-block";

  final systemLogRestProvider = SystemLogRestProvider();

  SystemLog25aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  Future<ApiResult<PageData<SystemLogInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required EmptyFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    // Return empty list:
    return ApiResult.success(data: PageData.ofItems(<SystemLogInfo>[]));
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required int itemId}) async {
    return await systemLogRestProvider.delete(itemId);
  }

  @override
  Future<ApiResult<SystemLogData>> performLoadItemDetailById({
    required int itemId,
  }) async {
    return await systemLogRestProvider.find(systemLogId: itemId);
  }

  @override
  SystemLogInfo convertItemDetailToItem({required SystemLogData itemDetail}) {
    return itemDetail.toSystemLogInfo();
  }

  @override
  Object extractParentBlockItemId({required SystemLogInfo fromThisBlockItem}) {
    throw FeatureUnsupportedException(
      "Not Care!, See the document for details",
    );
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required EmptyFilterCriteria filterCriteria,
    required SystemLogData itemDetail,
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
    required SystemLogData? currentItemDetail,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
