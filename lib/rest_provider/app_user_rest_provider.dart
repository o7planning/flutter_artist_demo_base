import 'package:dio/dio.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';
import '../model/uint8_list_file_data.dart';

class AppUserRestProvider {
  // /rest/appUserInfoPage
  Future<ApiResult<AppUserInfoPage>> query({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/appUserInfoPage
    ApiResult<AppUserInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/appUserInfoPage",
      queryParameters: queryParameters,
      converter: AppUserInfoPage.fromJson,
    );
    return result;
  }

  // /rest/appUser/1
  Future<ApiResult<AppUserData>> find({required int appUserId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/appUser/1
    ApiResult<AppUserData> result = await flutterArtistDio.jsonGet(
      "/rest/appUser/$appUserId",
      queryParameters: queryParameters,
      converter: AppUserData.fromJson,
    );
    return result;
  }

  Future<ApiResult<AppUserData>> createAppUser(
    Map<String, dynamic> formMapData,
  ) async {
    List<dynamic>? xFiles = formMapData["xFiles"];
    XFile? xFile = xFiles?.firstOrNull;
    Uint8ListFileData? uint8ListFile = xFile == null
        ? null
        : await Uint8ListFileData.fromXFile(xFile);
    MultipartFile? multipartFile = uint8ListFile?.toMultipartFile();

    var formData = FormData.fromMap({
      "userName": formMapData["userName"],
      "fullName": formMapData["fullName"],
      "email": formMapData["email"],
      "enabled": formMapData["enabled"],
      "multipartFile": multipartFile,
    });

    // /rest/appUser/create
    ApiResult<AppUserData> result = await flutterArtistDio.jsonPost(
      "/rest/appUser/create",
      queryParameters: null,
      data: formData,
      converter: AppUserData.fromJson,
      showDebug: true,
    );
    return result;
  }

  Future<ApiResult<AppUserData>> updateAppUser(
    Map<String, dynamic> formMapData,
  ) async {
    List<dynamic>? xFiles = formMapData["xFiles"];
    XFile? xFile = xFiles?.firstOrNull;
    Uint8ListFileData? uint8ListFile = xFile == null
        ? null
        : await Uint8ListFileData.fromXFile(xFile);
    MultipartFile? multipartFile = uint8ListFile?.toMultipartFile();

    var formData = FormData.fromMap({
      "id": formMapData["id"],
      "userName": formMapData["userName"],
      "fullName": formMapData["fullName"],
      "email": formMapData["email"],
      "enabled": formMapData["enabled"],
      "multipartFile": multipartFile,
    });

    // /rest/appUser/update
    ApiResult<AppUserData> result = await flutterArtistDio.jsonPut(
      "/rest/appUser/update",
      queryParameters: null,
      data: formData,
      converter: AppUserData.fromJson,
    );
    return result;
  }
}
