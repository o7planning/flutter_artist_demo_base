import 'package:dio/dio.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class SalesOrderLineRestProvider {
  // /rest/salesOrderLineInfoPage/all/bySalesOrderId/$salesOrderId
  Future<ApiResult<SalesOrderLineInfoPage>> queryAllBySalesOrderId({
    required int salesOrderId,
  }) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/salesOrderLineInfoPage/all/bySalesOrderId/$salesOrderId
    ApiResult<SalesOrderLineInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/salesOrderLineInfoPage/all/bySalesOrderId/$salesOrderId",
      queryParameters: queryParameters,
      converter: SalesOrderLineInfoPage.fromJson,
    );
    return result;
  }

  // /rest/salesOrderLine/1
  Future<ApiResult<SalesOrderLineData>> find({
    required int salesOrderLineId,
  }) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/salesOrderLine/1
    ApiResult<SalesOrderLineData> result = await flutterArtistDio.jsonGet(
      "/rest/salesOrderLine/$salesOrderLineId",
      queryParameters: queryParameters,
      converter: SalesOrderLineData.fromJson,
    );
    return result;
  }

  Future<ApiResult<SalesOrderLineData>> createSalesOrderLine(
    Map<String, dynamic> formMapData,
  ) async {
    ProductInfo? productInfo = formMapData["product"];

    var formData = FormData.fromMap({
      "productId": productInfo?.id,
      "units": formMapData["units"],
      "salesOrderId": formMapData["salesOrderId"],
    });

    // /rest/salesOrderLine/create
    ApiResult<SalesOrderLineData> result = await flutterArtistDio.jsonPost(
      "/rest/salesOrderLine/create",
      queryParameters: null,
      data: formData,
      converter: SalesOrderLineData.fromJson,
      showDebug: true,
    );
    return result;
  }

  Future<ApiResult<SalesOrderLineData>> updateSalesOrderLine(
    Map<String, dynamic> formMapData,
  ) async {
    ProductInfo? productInfo = formMapData["product"];

    var formData = FormData.fromMap({
      "id": formMapData["id"],
      "productId": productInfo?.id,
      "units": formMapData["units"],
      "salesOrderId": formMapData["salesOrderId"],
    });

    // /rest/salesOrderLine/update
    ApiResult<SalesOrderLineData> result = await flutterArtistDio.jsonPut(
      "/rest/salesOrderLine/update",
      queryParameters: null,
      data: formData,
      converter: SalesOrderLineData.fromJson,
    );
    return result;
  }

  Future<ApiResult<void>> delete(int salesOrderLineId) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/salesOrderLine/delete/$salesOrderLineId
    ApiResult<void> result = await flutterArtistDio.jsonDelete(
      "/rest/salesOrderLine/delete/$salesOrderLineId",
      queryParameters: queryParameters,
      converter: null,
    );
    return result;
  }
}
