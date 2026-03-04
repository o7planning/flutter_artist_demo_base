import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class CategoryRestProvider {
  // /rest/companyInfoPage/all
  // Future<ApiResult<CompanyInfoPage>> queryAll() async {
  //   Map<String, dynamic>? queryParameters = {};
  //
  //   // /rest/companyInfoPage/all
  //   ApiResult<CompanyInfoPage> result = await flutterArtistDio.jsonGet(
  //     "/rest/companyInfoPage/all",
  //     queryParameters: queryParameters,
  //     converter: CompanyInfoPage.fromJson,
  //   );
  //   return result;
  // }

  // TODO: Them tren backEnd.
  // /rest/categoryInfoPage
  Future<ApiResult<CategoryInfoPage>> queryAll() async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/categoryInfoPage
    ApiResult<CategoryInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/categoryInfoPage",
      queryParameters: queryParameters,
      converter: CategoryInfoPage.fromJson,
    );
    return result;
  }

  // /rest/categoryInfoPage
  Future<ApiResult<CategoryInfoPage>> query({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/categoryInfoPage
    ApiResult<CategoryInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/categoryInfoPage",
      queryParameters: queryParameters,
      converter: CategoryInfoPage.fromJson,
    );
    return result;
  }

  // /rest/category/1
  Future<ApiResult<CategoryData>> find({required int categoryId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/category/1
    ApiResult<CategoryData> result = await flutterArtistDio.jsonGet(
      "/rest/category/$categoryId",
      queryParameters: queryParameters,
      converter: CategoryData.fromJson,
    );
    return result;
  }
}
