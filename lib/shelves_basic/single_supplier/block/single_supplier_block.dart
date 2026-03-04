import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/model/model.dart';
import 'package:flutter_artist_demo_base/rest_provider/supplier_rest_provider.dart';

class SingleSupplierBlock
    extends
        SingleItemBlock<
          int, //
          SupplierData,
          IntIdFilterInput,
          IntIdFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const String blockName = "single-supplier-block";

  final supplierRestProvider = SupplierRestProvider();

  SingleSupplierBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  Future<ApiResult<SupplierData>> performQuerySingleItem({
    required Object? parentBlockCurrentItem,
    required IntIdFilterCriteria filterCriteria,
  }) async {
    if (filterCriteria.idValue == null) {
      // No Supplier.
      return ApiResult<SupplierData>.success(data: null);
    }
    return await supplierRestProvider.find(supplierId: filterCriteria.idValue!);
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
  Object extractParentBlockItemId({required SupplierData fromThisBlockItem}) {
    throw FeatureUnsupportedException(
      "Not Care!, See the document for details",
    );
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required IntIdFilterCriteria filterCriteria,
    required SupplierData itemDetail,
  }) {
    return true;
  }

  @override
  EmptyFormInput buildInputForCreationForm({
    required Object? parentBlockCurrentItem,
    required IntIdFilterCriteria filterCriteria,
  }) {
    return EmptyFormInput();
  }

  @override
  Future<EmptyFormRelatedData> performLoadFormRelatedData({
    required Object? parentBlockCurrentItem,
    required SupplierData? currentItemDetail,
    required IntIdFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
