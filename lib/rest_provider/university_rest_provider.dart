import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class UniversityRestProvider {
  // /rest/universityInfoPage/all
  Future<ApiResult<UniversityInfoPage>> allUniversities() async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/universityInfoPage/all
    ApiResult<UniversityInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/universityInfoPage/all",
      queryParameters: queryParameters,
      converter: UniversityInfoPage.fromJson,
    );
    return result;
  }

  // /rest/universityInfoPage/search
  Future<ApiResult<UniversityInfoPage>> querySearch({
    required Pageable pageable,
    required String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/universityInfoPage/search
    ApiResult<UniversityInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/universityInfoPage/search",
      queryParameters: queryParameters,
      converter: UniversityInfoPage.fromJson,
    );
    return result;
  }

  // /rest/university/1
  Future<ApiResult<UniversityData>> find({required int universityId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/university/1
    ApiResult<UniversityData> result = await flutterArtistDio.jsonGet(
      "/rest/university/$universityId",
      queryParameters: queryParameters,
      converter: UniversityData.fromJson,
    );
    return result;
  }
}
