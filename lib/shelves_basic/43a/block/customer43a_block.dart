import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/customer_rest_provider.dart';

class Customer43aBlock
    extends
        Block<
          int, //
          CustomerInfo,
          CustomerData,
          EmptyFilterInput,
          EmptyFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const blkName = "customer43a-block";

  final customerRestProvider = CustomerRestProvider();

  Customer43aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  Future<ApiResult<PageData<CustomerInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required EmptyFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    return await customerRestProvider.query(pageable: pageable);
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required int itemId}) async {
    return await customerRestProvider.delete(itemId);
  }

  @override
  Future<ApiResult<CustomerData>> performLoadItemDetailById({
    required int itemId,
  }) async {
    return await customerRestProvider.find(customerId: itemId);
  }

  @override
  CustomerInfo convertItemDetailToItem({required CustomerData itemDetail}) {
    return itemDetail.toCustomerInfo();
  }

  @override
  Object extractParentBlockItemId({required CustomerInfo fromThisBlockItem}) {
    throw FeatureUnsupportedException(
      "Not Care!, See the document for details",
    );
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required EmptyFilterCriteria filterCriteria,
    required CustomerData itemDetail,
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
    required CustomerData? currentItemDetail,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
