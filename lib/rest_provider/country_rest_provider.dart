import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class CountryRestProvider {
  // /rest/countryInfoPage
  Future<ApiResult<CountryInfoPage>> query({
    required Pageable pageable,
    SortableCriteria? sortableCriteria,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
      // Json String: '{"criterion1": "asc", "criterion2": "desc"}'.
      "jsonSortableCriteria": sortableCriteria?.toJsonString(),
    };

    // /rest/countryInfoPage
    ApiResult<CountryInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/countryInfoPage",
      queryParameters: queryParameters,
      converter: CountryInfoPage.fromJson,
    );
    return result;
  }

  // /rest/country/vn
  Future<ApiResult<CountryData>> find({required String countryId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/country/1
    ApiResult<CountryData> result = await flutterArtistDio.jsonGet(
      "/rest/country/$countryId",
      queryParameters: queryParameters,
      converter: CountryData.fromJson,
    );
    return result;
  }

  Future<ApiResult<void>> delete(String countryId) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/country/delete/countryId
    ApiResult<void> result = await flutterArtistDio.jsonDelete(
      "/rest/country/delete/$countryId",
      queryParameters: queryParameters,
      converter: null,
    );
    return result;
  }
}
