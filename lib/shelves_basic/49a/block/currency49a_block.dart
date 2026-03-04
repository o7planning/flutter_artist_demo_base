import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/currency_rest_provider.dart';

class Currency49aBlock
    extends
        Block<
          String, //
          CurrencyInfo,
          CurrencyData,
          EmptyFilterInput,
          EmptyFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const String blkName = "currency49a-block";

  final currencyRestProvider = CurrencyRestProvider();

  Currency49aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  bool isItemDeletionAllowed({required CurrencyInfo item}) {
    return false;
  }

  @override
  Future<ApiResult<PageData<CurrencyInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required EmptyFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    return await currencyRestProvider.query(pageable: pageable);
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required String itemId}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<CurrencyData>> performLoadItemDetailById({
    required String itemId,
  }) async {
    return await currencyRestProvider.find(currencyId: itemId);
  }

  @override
  CurrencyInfo convertItemDetailToItem({required CurrencyData itemDetail}) {
    return itemDetail.toCurrencyInfo();
  }

  @override
  Object extractParentBlockItemId({required CurrencyInfo fromThisBlockItem}) {
    throw FeatureUnsupportedException(
      "Not Care!, See the document for details",
    );
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required EmptyFilterCriteria filterCriteria,
    required CurrencyData itemDetail,
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
    required CurrencyData? currentItemDetail,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
