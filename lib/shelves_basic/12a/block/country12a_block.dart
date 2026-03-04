import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/country_rest_provider.dart';

class Country12aBlock
    extends
        Block<
          String, //
          CountryInfo,
          CountryData,
          EmptyFilterInput,
          EmptyFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const blkName = "country12a-block";

  final countryRestProvider = CountryRestProvider();

  Country12aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
    required super.sortModelBuilder,
  });

  @override
  Future<ApiResult<PageData<CountryInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required EmptyFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    return await countryRestProvider.query(
      sortableCriteria: sortableCriteria,
      pageable: pageable,
    );
  }

  @override
  CountryInfo convertItemDetailToItem({required CountryData itemDetail}) {
    return itemDetail.toCountryInfo();
  }

  @override
  Object extractParentBlockItemId({required CountryInfo fromThisBlockItem}) {
    throw FeatureUnsupportedException(
      "Not Care!, See the document for details",
    );
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required EmptyFilterCriteria filterCriteria,
    required CountryData itemDetail,
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
    required CountryData? currentItemDetail,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required String itemId}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<CountryData>> performLoadItemDetailById({
    required String itemId,
  }) async {
    return await countryRestProvider.find(countryId: itemId);
  }
}
