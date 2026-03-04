import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class ContributorRestProvider {
  // /rest/contributorInfoPage/all/byProjectId/$projectId
  Future<ApiResult<ContributorInfoPage>> queryAllByProjectId({
    required int projectId,
  }) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/contributorInfoPage/all/byProjectId/$projectId
    ApiResult<ContributorInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/contributorInfoPage/all/byProjectId/$projectId",
      queryParameters: queryParameters,
      converter: ContributorInfoPage.fromJson,
    );
    return result;
  }

  // // /rest/contributorInfoPage
  // Future<ApiResult<ContributorInfoPage>> query({
  //   required Pageable pageable,
  //   String? searchText,
  // }) async {
  //   Map<String, dynamic>? queryParameters = {
  //     "currentPage": pageable.page,
  //     "pageSize": pageable.pageSize,
  //     "searchText": searchText,
  //   };
  //
  //   // /rest/contributorInfoPage
  //   ApiResult<ContributorInfoPage> result = await flutterArtistDio.jsonGet(
  //     "/rest/contributorInfoPage",
  //     queryParameters: queryParameters,
  //     converter: ContributorInfoPage.fromJson,
  //   );
  //   return result;
  // }
  //
  // /rest/contributor/1
  Future<ApiResult<ContributorData>> find({required int contributorId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/contributor/1
    ApiResult<ContributorData> result = await flutterArtistDio.jsonGet(
      "/rest/contributor/$contributorId",
      queryParameters: queryParameters,
      converter: ContributorData.fromJson,
    );
    return result;
  }

  Future<ApiResult<void>> delete(int contributorId) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/contributor/delete/contributorId
    ApiResult<void> result = await flutterArtistDio.jsonDelete(
      "/rest/contributor/delete/$contributorId",
      queryParameters: queryParameters,
      converter: null,
    );
    return result;
  }

  Future<ApiResult<void>> addMultiContributors(int projectId) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/contributor/addMultiContributors/projectId
    ApiResult<void> result = await flutterArtistDio.jsonPost(
      "/rest/contributor/addMultiContributors/$projectId",
      queryParameters: queryParameters,
      converter: null,
    );
    return result;
  }

  //
  // Future<ApiResult<ContributorData>> createContributor(
  //   Map<String, dynamic> formMapData,
  // ) async {
  //   List<dynamic>? xFiles = formMapData["xFiles"];
  //   XFile? xFile = xFiles?.firstOrNull;
  //   Uint8ListFileData? uint8ListFile = xFile == null
  //       ? null
  //       : await Uint8ListFileData.fromXFile(xFile);
  //   MultipartFile? multipartFile = uint8ListFile?.toMultipartFile();
  //
  //   var formData = FormData.fromMap({
  //     "code": formMapData["code"],
  //     "name": formMapData["name"],
  //     "projectId": formMapData["project"]?.id,
  //     "managerId": formMapData["manager"]?.id,
  //     "description": formMapData["description"],
  //     "multipartFile": multipartFile,
  //   });
  //
  //   // /rest/contributor/create
  //   ApiResult<ContributorData> result = await flutterArtistDio.jsonPost(
  //     "/rest/contributor/create",
  //     queryParameters: null,
  //     data: formData,
  //     converter: ContributorData.fromJson,
  //     showDebug: true,
  //   );
  //   return result;
  // }
  //
  // Future<ApiResult<ContributorData>> updateContributor(
  //   Map<String, dynamic> formMapData,
  // ) async {
  //   List<dynamic>? xFiles = formMapData["xFiles"];
  //   XFile? xFile = xFiles?.firstOrNull;
  //   Uint8ListFileData? uint8ListFile = xFile == null
  //       ? null
  //       : await Uint8ListFileData.fromXFile(xFile);
  //   MultipartFile? multipartFile = uint8ListFile?.toMultipartFile();
  //
  //   var formData = FormData.fromMap({
  //     "id": formMapData["id"],
  //     "code": formMapData["code"],
  //     "name": formMapData["name"],
  //     "projectId": formMapData["project"]?.id,
  //     "managerId": formMapData["manager"]?.id,
  //     "description": formMapData["description"],
  //     "multipartFile": multipartFile,
  //   });
  //
  //   // /rest/contributor/update
  //   ApiResult<ContributorData> result = await flutterArtistDio.jsonPut(
  //     "/rest/contributor/update",
  //     queryParameters: null,
  //     data: formData,
  //     converter: ContributorData.fromJson,
  //   );
  //   return result;
  // }
}
