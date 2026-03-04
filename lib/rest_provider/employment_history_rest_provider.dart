import 'package:dio/dio.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';
import '../utils/date_utils.dart';

class EmploymentHistoryRestProvider {
  // /rest/employmentHistoryInfoPage
  Future<ApiResult<EmploymentHistoryInfoPage>> query({
    required Pageable pageable,
    required int employeeId,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
    };

    // /rest/employmentHistoryInfoPage/$employeeId
    ApiResult<EmploymentHistoryInfoPage> result = await flutterArtistDio
        .jsonGet(
          "/rest/employmentHistoryInfoPage/$employeeId",
          queryParameters: queryParameters,
          converter: EmploymentHistoryInfoPage.fromJson,
        );
    return result;
  }

  // /rest/employmentHistory/1
  Future<ApiResult<EmploymentHistoryData>> find({
    required int employmentHistoryId,
  }) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/employmentHistory/1
    ApiResult<EmploymentHistoryData> result = await flutterArtistDio.jsonGet(
      "/rest/employmentHistory/$employmentHistoryId",
      queryParameters: queryParameters,
      converter: EmploymentHistoryData.fromJson,
    );
    return result;
  }

  Future<ApiResult<void>> delete(int employmentHistoryId) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/employmentHistory/delete/$employmentHistoryId
    ApiResult<void> result = await flutterArtistDio.jsonDelete(
      "/rest/employmentHistory/delete/$employmentHistoryId",
      queryParameters: queryParameters,
      converter: null,
    );
    return result;
  }

  Future<ApiResult<EmploymentHistoryData>> createEmploymentHistory(
    Map<String, dynamic> formMapData,
  ) async {
    DateTime fromDate = formMapData["fromDate"];
    DateTime? toDate = formMapData["toDate"];
    dynamic company = formMapData["company"];
    int companyId;
    // Example: EmpEmploymentHistory36a.
    if (company is CompanyInfo) {
      companyId = company.id;
    }
    // Example: EmpEmploymentHistory60a.
    else if (company is CompanyTreeItem) {
      companyId = company.id;
    }
    // No Example.
    else {
      throw "Todo";
    }
    DepartmentInfo department = formMapData["department"];
    EmployeePositionInfo employeePosition = formMapData["employeePosition"];
    //
    var formData = FormData.fromMap({
      "employeeId": formMapData["employeeId"],
      "fromDate": dateToString(fromDate), // yyyy-MM-dd
      "toDate": toDate == null ? null : dateToString(toDate), // yyyy-MM-dd
      "companyId": companyId,
      "departmentId": department.id,
      "employeePositionId": employeePosition.id,
    });

    // /rest/employmentHistory/create
    ApiResult<EmploymentHistoryData> result = await flutterArtistDio.jsonPost(
      "/rest/employmentHistory/create",
      queryParameters: null,
      data: formData,
      converter: EmploymentHistoryData.fromJson,
      showDebug: true,
    );
    return result;
  }

  Future<ApiResult<EmploymentHistoryData>> updateEmploymentHistory(
    Map<String, dynamic> formMapData,
  ) async {
    DateTime fromDate = formMapData["fromDate"];
    DateTime? toDate = formMapData["toDate"];
    //
    dynamic company = formMapData["company"];
    int companyId;
    // Example: EmpEmploymentHistory36a.
    if (company is CompanyInfo) {
      companyId = company.id;
    }
    // Example: EmpEmploymentHistory60a.
    else if (company is CompanyTreeItem) {
      companyId = company.id;
    }
    // No Example.
    else {
      throw "Todo";
    }
    //
    DepartmentInfo department = formMapData["department"];
    EmployeePositionInfo employeePosition = formMapData["employeePosition"];
    //
    var formData = FormData.fromMap({
      "employeeId": formMapData["employeeId"],
      "id": formMapData["id"],
      "fromDate": dateToString(fromDate), // yyyy-MM-dd
      "toDate": toDate == null ? null : dateToString(toDate), // yyyy-MM-dd
      "companyId": company.id,
      "departmentId": department.id,
      "employeePositionId": employeePosition.id,
    });

    // /rest/employmentHistory/update
    ApiResult<EmploymentHistoryData> result = await flutterArtistDio.jsonPut(
      "/rest/employmentHistory/update",
      queryParameters: null,
      data: formData,
      converter: EmploymentHistoryData.fromJson,
    );
    return result;
  }
}
