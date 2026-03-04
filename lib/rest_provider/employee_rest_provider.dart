import 'package:dio/dio.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';
import '../model/uint8_list_file_data.dart';
import '../utils/date_utils.dart';

class EmployeeRestProvider {
  // /rest/employee/all/byCompany/$companyId
  Future<ApiResult<EmployeeInfoPage>> queryAllEmployeeByCompanyId({
    required int companyId,
  }) async {
    Map<String, dynamic>? queryParameters = {"companyId": companyId};

    // /rest/employee/all/byCompany/$companyId
    ApiResult<EmployeeInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/employee/all/byCompany/$companyId",
      queryParameters: queryParameters,
      converter: EmployeeInfoPage.fromJson,
    );
    return result;
  }

  // /rest/employeeInfoPage
  Future<ApiResult<EmployeeInfoPage>> queryAdvanced({
    required Pageable pageable,
    String? searchText,
    int? companyId,
    String? departmentIdsAsString, // "1,2,3".
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
      "companyId": companyId,
      "departmentIdsAsString": departmentIdsAsString,
    };

    // /rest/searchAdv/employeeInfoPage
    ApiResult<EmployeeInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/searchAdv/employeeInfoPage",
      queryParameters: queryParameters,
      converter: EmployeeInfoPage.fromJson,
    );
    return result;
  }

  // /rest/employeeInfoPage
  Future<ApiResult<EmployeeInfoPage>> query({
    required Pageable pageable,
    String? searchText,
    int? companyId,
    int? departmentId,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
      "companyId": companyId,
      "departmentId": departmentId,
    };

    // /rest/employeeInfoPage
    ApiResult<EmployeeInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/employeeInfoPage",
      queryParameters: queryParameters,
      converter: EmployeeInfoPage.fromJson,
    );
    return result;
  }

  // /rest/employee/1
  Future<ApiResult<EmployeeData>> find({required int employeeId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/employee/1
    ApiResult<EmployeeData> result = await flutterArtistDio.jsonGet(
      "/rest/employee/$employeeId",
      queryParameters: queryParameters,
      converter: EmployeeData.fromJson,
    );
    return result;
  }

  Future<ApiResult<void>> delete(int employeeId) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/employee/delete/$employeeId
    ApiResult<void> result = await flutterArtistDio.jsonDelete(
      "/rest/employee/delete/$employeeId",
      queryParameters: queryParameters,
      converter: null,
    );
    return result;
  }

  Future<ApiResult<EmployeeData>> createEmployee(
    Map<String, dynamic> formMapData,
  ) async {
    DateTime birthday = formMapData["birthday"];
    DateTime hireDate = formMapData["hireDate"];
    EmployeePositionInfo? position = formMapData["employeePosition"];

    // DateTime => yyyy-MM-dd
    String birthdayStr = dateToString(birthday);
    String hireDateStr = dateToString(hireDate);

    List<dynamic>? xFiles = formMapData["xFiles"];
    XFile? xFile = xFiles?.firstOrNull;
    Uint8ListFileData? uint8ListFile = xFile == null
        ? null
        : await Uint8ListFileData.fromXFile(xFile);
    MultipartFile? multipartFile = uint8ListFile?.toMultipartFile();

    var formData = FormData.fromMap({
      "empNumber": formMapData["empNumber"],
      "name": formMapData["name"],
      "email": formMapData["email"],
      "birthday": birthdayStr,
      "hireDate": hireDateStr,
      "address": formMapData["address"],
      "employeePositionId": position?.id,
      "multipartFile": multipartFile,
    });

    // /rest/employee/create
    ApiResult<EmployeeData> result = await flutterArtistDio.jsonPost(
      "/rest/employee/create",
      queryParameters: null,
      data: formData,
      converter: EmployeeData.fromJson,
      showDebug: true,
    );
    return result;
  }

  Future<ApiResult<EmployeeData>> updateEmployee(
    Map<String, dynamic> formMapData,
  ) async {
    DateTime birthday = formMapData["birthday"];
    DateTime hireDate = formMapData["hireDate"];
    EmployeePositionInfo? position = formMapData["employeePosition"];

    // DateTime => yyyy-MM-dd
    String birthdayStr = dateToString(birthday);
    String hireDateStr = dateToString(hireDate);

    List<dynamic>? xFiles = formMapData["xFiles"];
    XFile? xFile = xFiles?.firstOrNull;
    Uint8ListFileData? uint8ListFile = xFile == null
        ? null
        : await Uint8ListFileData.fromXFile(xFile);
    MultipartFile? multipartFile = uint8ListFile?.toMultipartFile();

    var formData = FormData.fromMap({
      "id": formMapData["id"],
      "empNumber": formMapData["empNumber"],
      "name": formMapData["name"],
      "email": formMapData["email"],
      "birthday": birthdayStr,
      "hireDate": hireDateStr,
      "address": formMapData["address"],
      "employeePositionId": position?.id,
      "multipartFile": multipartFile,
    });

    // /rest/employee/update
    ApiResult<EmployeeData> result = await flutterArtistDio.jsonPut(
      "/rest/employee/update",
      queryParameters: null,
      data: formData,
      converter: EmployeeData.fromJson,
    );
    return result;
  }

  Future<ApiResult<EmployeeInfoPage>> queryWithFieldBasedJSON({
    required Pageable pageable,
    required String fieldBasedJSON,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "fieldBasedJSON": fieldBasedJSON,
    };

    // /rest/advancedGet/employeeInfoPage
    ApiResult<EmployeeInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/advancedGet/employeeInfoPage",
      queryParameters: queryParameters,
      converter: EmployeeInfoPage.fromJson,
    );
    return result;
  }
}
