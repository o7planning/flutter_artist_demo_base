import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class ProjectRestProvider {
  // /rest/projectInfoPage/all
  Future<ApiResult<ProjectInfoPage>> queryAll() async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/projectInfoPage/all
    ApiResult<ProjectInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/projectInfoPage/all",
      queryParameters: queryParameters,
      converter: ProjectInfoPage.fromJson,
    );
    return result;
  }

  // /rest/projectInfoPage
  Future<ApiResult<ProjectInfoPage>> query({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/projectInfoPage
    ApiResult<ProjectInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/projectInfoPage",
      queryParameters: queryParameters,
      converter: ProjectInfoPage.fromJson,
    );
    return result;
  }

  // /rest/project/1
  Future<ApiResult<ProjectData>> findProjectData({
    required int projectId,
  }) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/project/1
    ApiResult<ProjectData> result = await flutterArtistDio.jsonGet(
      "/rest/project/$projectId",
      queryParameters: queryParameters,
      converter: ProjectData.fromJson,
    );
    return result;
  }
}
