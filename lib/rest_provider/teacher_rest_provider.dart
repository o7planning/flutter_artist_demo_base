import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class TeacherRestProvider {
  // /rest/teacherInfoPage/search
  Future<ApiResult<TeacherInfoPage>> querySearch({
    required Pageable pageable,
    required String? searchText,
    required int? universityId,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
      "universityId": universityId,
    };

    // /rest/teacherInfoPage/search
    ApiResult<TeacherInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/teacherInfoPage/search",
      queryParameters: queryParameters,
      converter: TeacherInfoPage.fromJson,
    );
    return result;
  }

  // /rest/teacher/1
  Future<ApiResult<TeacherData>> find({required int teacherId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/teacher/1
    ApiResult<TeacherData> result = await flutterArtistDio.jsonGet(
      "/rest/teacher/$teacherId",
      queryParameters: queryParameters,
      converter: TeacherData.fromJson,
    );
    return result;
  }
}
