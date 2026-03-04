import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/product_rest_provider.dart';
import '../filter_criteria/product77a_filter_criteria.dart';

class Product77aBlock
    extends
        Block<
          int, //
          ProductInfo,
          ProductData,
          EmptyFilterInput,
          Product77aFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const blkName = "product77a-block";

  final productRestProvider = ProductRestProvider();

  Product77aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  Future<ApiResult<PageData<ProductInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required Product77aFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    return await productRestProvider.queryWithFieldBasedJSON(
      pageable: pageable,
      fieldBasedJSON: filterCriteria.fieldBasedJSON,
    );
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required int itemId}) async {
    return await productRestProvider.delete(itemId);
  }

  @override
  Future<ApiResult<ProductData>> performLoadItemDetailById({
    required int itemId,
  }) async {
    return await productRestProvider.find(productId: itemId);
  }

  @override
  ProductInfo convertItemDetailToItem({required ProductData itemDetail}) {
    return itemDetail.toProductInfo();
  }

  @override
  Object extractParentBlockItemId({required ProductInfo fromThisBlockItem}) {
    throw FeatureUnsupportedException(
      "Not Care!, See the document for details",
    );
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required Product77aFilterCriteria filterCriteria,
    required ProductData itemDetail,
  }) {
    return true;
  }

  @override
  EmptyFormInput buildInputForCreationForm({
    required Object? parentBlockCurrentItem,
    required Product77aFilterCriteria filterCriteria,
  }) {
    return EmptyFormInput();
  }

  @override
  Future<EmptyFormRelatedData> performLoadFormRelatedData({
    required Object? parentBlockCurrentItem,
    required ProductData? currentItemDetail,
    required Product77aFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
