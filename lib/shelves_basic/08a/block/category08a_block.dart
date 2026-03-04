import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/model/model.dart';
import 'package:flutter_artist_demo_base/rest_provider/category_rest_provider.dart';

class Category08aBlock
    extends
        Block<
          int, //
          CategoryInfo,
          CategoryData,
          EmptyFilterInput,
          EmptyFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const String blkName = "category08a-block";

  final categoryRestProvider = CategoryRestProvider();

  Category08aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  Future<ApiResult<PageData<CategoryInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required EmptyFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    return await categoryRestProvider.query(pageable: pageable);
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required int itemId}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<CategoryData>> performLoadItemDetailById({
    required int itemId,
  }) async {
    return await categoryRestProvider.find(categoryId: itemId);
  }

  @override
  CategoryInfo convertItemDetailToItem({required CategoryData itemDetail}) {
    return itemDetail;
  }

  @override
  Object extractParentBlockItemId({required CategoryInfo fromThisBlockItem}) {
    throw FeatureUnsupportedException(
      "Not Care!, See the document for details",
    );
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required EmptyFilterCriteria filterCriteria,
    required CategoryData itemDetail,
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
    required CategoryData? currentItemDetail,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
