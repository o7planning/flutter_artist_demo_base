import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/model/model.dart';

import '../../../rest_provider/sales_order_line_rest_provider.dart';

class SalesOrderLine96aBlock
    extends
        Block<
          int, //
          SalesOrderLineInfo,
          SalesOrderLineData,
          EmptyFilterInput,
          EmptyFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const String blkName = "sales-order-line96a-block";

  final salesOrderLineRestProvider = SalesOrderLineRestProvider();

  SalesOrderLine96aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  Future<ApiResult<PageData<SalesOrderLineInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required EmptyFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    // Because SalesOrderLine96aBlock is the child-block of SalesOrder96aBlock
    // parentBlockCurrentItem is guaranteed not null.
    SalesOrderInfo parentItem = parentBlockCurrentItem as SalesOrderInfo;
    //
    return await salesOrderLineRestProvider.queryAllBySalesOrderId(
      salesOrderId: parentItem.id,
    );
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required int itemId}) async {
    return await salesOrderLineRestProvider.delete(itemId);
  }

  @override
  Future<ApiResult<SalesOrderLineData>> performLoadItemDetailById({
    required int itemId,
  }) async {
    return await salesOrderLineRestProvider.find(salesOrderLineId: itemId);
  }

  @override
  SalesOrderLineInfo convertItemDetailToItem({
    required SalesOrderLineData itemDetail,
  }) {
    return itemDetail.toSalesOrderLineInfo();
  }

  @override
  Object extractParentBlockItemId({
    required SalesOrderLineInfo fromThisBlockItem,
  }) {
    return fromThisBlockItem.salesOrderId;
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required EmptyFilterCriteria filterCriteria,
    required SalesOrderLineData itemDetail,
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
    required SalesOrderLineData? currentItemDetail,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
