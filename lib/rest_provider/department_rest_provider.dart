import 'package:dio/dio.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';
import '../model/uint8_list_file_data.dart';

class DepartmentRestProvider {
  // /rest/departmentInfoPage/all/byCompanyId/$companyId
  Future<ApiResult<DepartmentInfoPage>> queryAllByCompanyId({
    required int companyId,
  }) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/departmentInfoPage/all/byCompanyId/$companyId
    ApiResult<DepartmentInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/departmentInfoPage/all/byCompanyId/$companyId",
      queryParameters: queryParameters,
      converter: DepartmentInfoPage.fromJson,
    );
    return result;
  }

  // /rest/departmentInfoPage
  Future<ApiResult<DepartmentInfoPage>> query({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/departmentInfoPage
    ApiResult<DepartmentInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/departmentInfoPage",
      queryParameters: queryParameters,
      converter: DepartmentInfoPage.fromJson,
    );
    return result;
  }

  // /rest/department/1
  Future<ApiResult<DepartmentData>> find({required int departmentId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/department/1
    ApiResult<DepartmentData> result = await flutterArtistDio.jsonGet(
      "/rest/department/$departmentId",
      queryParameters: queryParameters,
      converter: DepartmentData.fromJson,
    );
    return result;
  }

  Future<ApiResult<DepartmentData>> createDepartment(
    Map<String, dynamic> formMapData,
  ) async {
    List<dynamic>? xFiles = formMapData["xFiles"];
    XFile? xFile = xFiles?.firstOrNull;
    Uint8ListFileData? uint8ListFile = xFile == null
        ? null
        : await Uint8ListFileData.fromXFile(xFile);
    MultipartFile? multipartFile = uint8ListFile?.toMultipartFile();

    var formData = FormData.fromMap({
      "code": formMapData["code"],
      "name": formMapData["name"],
      "companyId": formMapData["company"]?.id,
      "managerId": formMapData["manager"]?.id,
      "description": formMapData["description"],
      "multipartFile": multipartFile,
    });

    // /rest/department/create
    ApiResult<DepartmentData> result = await flutterArtistDio.jsonPost(
      "/rest/department/create",
      queryParameters: null,
      data: formData,
      converter: DepartmentData.fromJson,
      showDebug: true,
    );
    return result;
  }

  Future<ApiResult<DepartmentData>> updateDepartment(
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
      "code": formMapData["code"],
      "name": formMapData["name"],
      "companyId": formMapData["company"]?.id,
      "managerId": formMapData["manager"]?.id,
      "description": formMapData["description"],
      "multipartFile": multipartFile,
    });

    // /rest/department/update
    ApiResult<DepartmentData> result = await flutterArtistDio.jsonPut(
      "/rest/department/update",
      queryParameters: null,
      data: formData,
      converter: DepartmentData.fromJson,
    );
    return result;
  }

  Future<ApiResult<DepartmentData>> removeManager({
    required int departmentId,
  }) async {
    var formData = FormData.fromMap({});

    // /rest/department/removeManager/$departmentId
    ApiResult<DepartmentData> result = await flutterArtistDio.jsonPut(
      "/rest/department/removeManager/$departmentId",
      queryParameters: null,
      data: formData,
      converter: DepartmentData.fromJson,
    );
    return result;
  }
}
