import 'package:dio/dio.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';
import '../utils/date_utils.dart';

class SalesOrderRestProvider {
  // /rest/salesOrderInfoPage
  Future<ApiResult<SalesOrderInfoPage>> query({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/salesOrderInfoPage
    ApiResult<SalesOrderInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/salesOrderInfoPage",
      queryParameters: queryParameters,
      converter: SalesOrderInfoPage.fromJson,
    );
    return result;
  }

  // /rest/salesOrder/1
  Future<ApiResult<SalesOrderData>> findSalesOrderData({
    required int salesOrderId,
  }) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/salesOrder/1
    ApiResult<SalesOrderData> result = await flutterArtistDio.jsonGet(
      "/rest/salesOrder/$salesOrderId",
      queryParameters: queryParameters,
      converter: SalesOrderData.fromJson,
    );
    return result;
  }

  Future<ApiResult<void>> delete(int salesOrderId) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/salesOrder/delete/$salesOrderId
    ApiResult<void> result = await flutterArtistDio.jsonDelete(
      "/rest/salesOrder/delete/$salesOrderId",
      queryParameters: queryParameters,
      converter: null,
    );
    return result;
  }

  // /rest/salesOrder/1
  Future<ApiResult<SalesOrderData>> find({required int salesOrderId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/salesOrder/1
    ApiResult<SalesOrderData> result = await flutterArtistDio.jsonGet(
      "/rest/salesOrder/$salesOrderId",
      queryParameters: queryParameters,
      converter: SalesOrderData.fromJson,
    );
    return result;
  }

  Future<ApiResult<SalesOrderData>> createSalesOrder(
    Map<String, dynamic> formMapData,
  ) async {
    CustomerInfo? customerInfo = formMapData["customer"];
    DateTime orderDateTime = formMapData["orderDateTime"];
    LoggedInUserData user = FlutterArtist.loggedInUser as LoggedInUserData;
    EmployeeData? employeeData = user.appUser.employee as EmployeeData?;

    var formData = FormData.fromMap({
      "customerId": customerInfo?.id,
      "employeeId": employeeData?.id,
      "orderDateTime": dateTimeToString(orderDateTime),
    });

    // /rest/salesOrder/create
    ApiResult<SalesOrderData> result = await flutterArtistDio.jsonPost(
      "/rest/salesOrder/create",
      queryParameters: null,
      data: formData,
      converter: SalesOrderData.fromJson,
      showDebug: true,
    );
    return result;
  }

  Future<ApiResult<SalesOrderData>> updateSalesOrder(
    Map<String, dynamic> formMapData,
  ) async {
    CustomerInfo? customerInfo = formMapData["customer"];
    DateTime orderDateTime = formMapData["orderDateTime"];
    LoggedInUserData user = FlutterArtist.loggedInUser as LoggedInUserData;
    EmployeeData? employeeData = user.appUser.employee as EmployeeData?;

    var formData = FormData.fromMap({
      "id": formMapData["id"],
      "customerId": customerInfo?.id,
      "employeeId": employeeData?.id,
      "orderDateTime": dateTimeToString(orderDateTime),
    });

    // /rest/salesOrder/update
    ApiResult<SalesOrderData> result = await flutterArtistDio.jsonPut(
      "/rest/salesOrder/update",
      queryParameters: null,
      data: formData,
      converter: SalesOrderData.fromJson,
    );
    return result;
  }
}
