import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class CurrencyRestProvider {
  // /rest/currencyInfoPage
  Future<ApiResult<CurrencyInfoPage>> query({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/currencyInfoPage
    ApiResult<CurrencyInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/currencyInfoPage",
      queryParameters: queryParameters,
      converter: CurrencyInfoPage.fromJson,
    );
    return result;
  }

  // /rest/currencyDataPage
  Future<ApiResult<CurrencyDataPage>> queryCurrencyDataPage({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/currencyDataPage
    ApiResult<CurrencyDataPage> result = await flutterArtistDio.jsonGet(
      "/rest/currencyDataPage",
      queryParameters: queryParameters,
      converter: CurrencyDataPage.fromJson,
    );
    return result;
  }

  // /rest/currency/USD
  Future<ApiResult<CurrencyData>> find({required String currencyId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/currency/USD
    ApiResult<CurrencyData> result = await flutterArtistDio.jsonGet(
      "/rest/currency/$currencyId",
      queryParameters: queryParameters,
      converter: CurrencyData.fromJson,
    );
    return result;
  }
}
