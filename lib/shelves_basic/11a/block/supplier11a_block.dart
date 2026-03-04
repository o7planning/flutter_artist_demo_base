import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/supplier_rest_provider.dart';

class Supplier11aBlock
    extends
        Block<
          int, //
          SupplierInfo,
          SupplierData,
          EmptyFilterInput,
          EmptyFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const String blkName = "supplier11a-block";

  final supplierRestProvider = SupplierRestProvider();

  Supplier11aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  Future<ApiResult<PageData<SupplierInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required EmptyFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    return await supplierRestProvider.query(pageable: pageable);
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required int itemId}) async {
    return await supplierRestProvider.delete(itemId);
  }

  @override
  Future<ApiResult<SupplierData>> performLoadItemDetailById({
    required int itemId,
  }) async {
    return await supplierRestProvider.find(supplierId: itemId);
  }

  @override
  SupplierInfo convertItemDetailToItem({required SupplierData itemDetail}) {
    return itemDetail.toSupplierInfo();
  }

  @override
  Object extractParentBlockItemId({required SupplierInfo fromThisBlockItem}) {
    throw FeatureUnsupportedException(
      "Not Care!, See the document for details",
    );
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required EmptyFilterCriteria filterCriteria,
    required SupplierData itemDetail,
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
    required SupplierData? currentItemDetail,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
