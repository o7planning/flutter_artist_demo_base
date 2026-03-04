import 'package:dio/dio.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';
import '../model/uint8_list_file_data.dart';

class SupplierRestProvider {
  // /rest/supplierInfoPage
  Future<ApiResult<SupplierInfoPage>> query({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/supplierInfoPage
    ApiResult<SupplierInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/supplierInfoPage",
      queryParameters: queryParameters,
      converter: SupplierInfoPage.fromJson,
    );
    return result;
  }

  // /rest/supplier/1
  Future<ApiResult<SupplierData>> find({required int supplierId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/supplier/1
    ApiResult<SupplierData> result = await flutterArtistDio.jsonGet(
      "/rest/supplier/$supplierId",
      queryParameters: queryParameters,
      converter: SupplierData.fromJson,
    );
    return result;
  }

  Future<ApiResult<void>> delete(int supplierId) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/supplier/delete/$supplierId
    ApiResult<void> result = await flutterArtistDio.jsonDelete(
      "/rest/supplier/delete/$supplierId",
      queryParameters: queryParameters,
      converter: null,
    );
    return result;
  }

  Future<ApiResult<SupplierData>> createSupplier(
    Map<String, dynamic> formMapData,
  ) async {
    List<dynamic>? xFiles = formMapData["xFiles"];
    XFile? xFile = xFiles?.firstOrNull;
    Uint8ListFileData? uint8ListFile = xFile == null
        ? null
        : await Uint8ListFileData.fromXFile(xFile);
    MultipartFile? multipartFile = uint8ListFile?.toMultipartFile();

    var formData = FormData.fromMap({
      "name": formMapData["name"],
      "email": formMapData["email"],
      "address": formMapData["address"],
      "phone": formMapData["phone"],
      "active": formMapData["active"] ?? false,
      "description": formMapData["description"],
      "supplierTypeId": formMapData["supplierType"]?.id,
      "multipartFile": multipartFile,
    });

    // /rest/supplier/create
    ApiResult<SupplierData> result = await flutterArtistDio.jsonPost(
      "/rest/supplier/create",
      queryParameters: null,
      data: formData,
      converter: SupplierData.fromJson,
      showDebug: true,
    );
    return result;
  }

  Future<ApiResult<SupplierData>> updateSupplier(
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
      "name": formMapData["name"],
      "email": formMapData["email"],
      "address": formMapData["address"],
      "phone": formMapData["phone"],
      "active": formMapData["active"] ?? false,
      "description": formMapData["description"],
      "supplierTypeId": formMapData["supplierType"]?.id,
      "multipartFile": multipartFile,
    });
    // /rest/supplier/update
    ApiResult<SupplierData> result = await flutterArtistDio.jsonPut(
      "/rest/supplier/update",
      queryParameters: null,
      data: formData,
      converter: SupplierData.fromJson,
    );
    return result;
  }
}
