import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/model/model.dart';

import '../../../rest_provider/sales_order_rest_provider.dart';

class SalesOrder96aBlock
    extends
        Block<
          int, //
          SalesOrderInfo,
          SalesOrderData,
          EmptyFilterInput,
          EmptyFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const String blkName = "sales-order96a-block";

  final salesOrderRestProvider = SalesOrderRestProvider();

  SalesOrder96aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  Future<ApiResult<PageData<SalesOrderInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required EmptyFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    return await salesOrderRestProvider.query(pageable: pageable);
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required int itemId}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<SalesOrderData>> performLoadItemDetailById({
    required int itemId,
  }) async {
    return await salesOrderRestProvider.find(salesOrderId: itemId);
  }

  @override
  SalesOrderInfo convertItemDetailToItem({required SalesOrderData itemDetail}) {
    return itemDetail;
  }

  @override
  Object extractParentBlockItemId({required SalesOrderInfo fromThisBlockItem}) {
    throw FeatureUnsupportedException(
      "Not Care!, See the document for details",
    );
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required EmptyFilterCriteria filterCriteria,
    required SalesOrderData itemDetail,
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
    required SalesOrderData? currentItemDetail,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
