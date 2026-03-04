import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/model/model.dart';

import '../../../rest_provider/product_rest_provider.dart';

class Product08aBlock
    extends
        Block<
          int, //
          ProductInfo,
          ProductData,
          EmptyFilterInput,
          EmptyFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const String blkName = "product08a-block";

  final productRestProvider = ProductRestProvider();

  Product08aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  bool isItemDeletionAllowed({required ProductInfo item}) {
    return false;
  }

  @override
  Future<ApiResult<PageData<ProductInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required EmptyFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    // Because Product08aBlock is the child-block of Category08aBlock
    // parentBlockCurrentItem is guaranteed not null.
    CategoryInfo parentItem = parentBlockCurrentItem as CategoryInfo;
    //
    return await productRestProvider.queryByCategoryId(
      categoryId: parentItem.id,
      pageable: pageable,
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
    return fromThisBlockItem.categoryId;
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required EmptyFilterCriteria filterCriteria,
    required ProductData itemDetail,
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
    required ProductData? currentItemDetail,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
