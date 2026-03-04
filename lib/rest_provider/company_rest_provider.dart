import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class CompanyRestProvider {
  // /rest/companyInfoPage/all
  Future<ApiResult<CompanyInfoPage>> queryAll() async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/companyInfoPage/all
    ApiResult<CompanyInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/companyInfoPage/all",
      queryParameters: queryParameters,
      converter: CompanyInfoPage.fromJson,
    );
    return result;
  }

  // /rest/companyInfoPage
  Future<ApiResult<CompanyInfoPage>> query({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/companyInfoPage
    ApiResult<CompanyInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/companyInfoPage",
      queryParameters: queryParameters,
      converter: CompanyInfoPage.fromJson,
    );
    return result;
  }

  // /rest/company/1
  Future<ApiResult<CompanyData>> findCompanyData({
    required int companyId,
  }) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/company/1
    ApiResult<CompanyData> result = await flutterArtistDio.jsonGet(
      "/rest/company/$companyId",
      queryParameters: queryParameters,
      converter: CompanyData.fromJson,
    );
    return result;
  }

  // /rest/company/detail/1
  Future<ApiResult<CompanyExtData>> findCompanyExt({
    required int companyId,
  }) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/company/detail/1
    ApiResult<CompanyExtData> result = await flutterArtistDio.jsonGet(
      "/rest/company/detail/$companyId",
      queryParameters: queryParameters,
      converter: CompanyExtData.fromJson,
    );
    return result;
  }
}
