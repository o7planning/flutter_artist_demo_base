import 'package:dio/dio.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';
import '../model/uint8_list_file_data.dart';

class ProductRestProvider {
  // /rest/productInfoPage/all
  Future<ApiResult<ProductInfoPage>> queryAll() async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/productInfoPage/all
    ApiResult<ProductInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/productInfoPage/all",
      queryParameters: queryParameters,
      converter: ProductInfoPage.fromJson,
    );
    return result;
  }

  // /rest/productInfoPage
  Future<ApiResult<ProductInfoPage>> query({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/productInfoPage
    ApiResult<ProductInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/productInfoPage",
      queryParameters: queryParameters,
      converter: ProductInfoPage.fromJson,
    );
    return result;
  }

  // /rest/productInfoPage
  Future<ApiResult<ProductInfoPage>> queryByCategoryId({
    required int categoryId,
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "categoryId": categoryId,
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/productInfoPage
    ApiResult<ProductInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/productInfoPage",
      queryParameters: queryParameters,
      converter: ProductInfoPage.fromJson,
    );
    return result;
  }

  // /rest/product/1
  Future<ApiResult<ProductData>> find({required int productId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/product/1
    ApiResult<ProductData> result = await flutterArtistDio.jsonGet(
      "/rest/product/$productId",
      queryParameters: queryParameters,
      converter: ProductData.fromJson,
    );
    return result;
  }

  Future<ApiResult<void>> delete(int productId) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/product/delete/$productId
    ApiResult<void> result = await flutterArtistDio.jsonDelete(
      "/rest/product/delete/$productId",
      queryParameters: queryParameters,
      converter: null,
    );
    return result;
  }

  Future<ApiResult<ProductData>> createProduct(
    Map<String, dynamic> formMapData,
  ) async {
    List<dynamic>? xFiles = formMapData["xFiles"];
    XFile? xFile = xFiles?.firstOrNull;
    Uint8ListFileData? uint8ListFile = xFile == null
        ? null
        : await Uint8ListFileData.fromXFile(xFile);
    MultipartFile? multipartFile = uint8ListFile?.toMultipartFile();

    var formData = FormData.fromMap({
      "categoryId": formMapData["categoryId"],
      "name": formMapData["name"],
      "price": formMapData["price"],
      "estimatedInputPrice": formMapData["estimatedInputPrice"],
      "taxRate": formMapData["taxRate"],
      "active": formMapData["active"] ?? false,
      "multipartFile": multipartFile,
    });

    // /rest/product/create
    ApiResult<ProductData> result = await flutterArtistDio.jsonPost(
      "/rest/product/create",
      queryParameters: null,
      data: formData,
      converter: ProductData.fromJson,
      showDebug: true,
    );
    return result;
  }

  Future<ApiResult<ProductData>> updateProduct(
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
      "categoryId": formMapData["categoryId"],
      "name": formMapData["name"],
      "price": formMapData["price"],
      "estimatedInputPrice": formMapData["estimatedInputPrice"],
      "taxRate": formMapData["taxRate"],
      "active": formMapData["active"] ?? false,
      "multipartFile": multipartFile,
    });

    // /rest/product/update
    ApiResult<ProductData> result = await flutterArtistDio.jsonPut(
      "/rest/product/update",
      queryParameters: null,
      data: formData,
      converter: ProductData.fromJson,
    );
    return result;
  }

  Future<ApiResult<ProductInfoPage>> queryWithFieldBasedJSON({
    required Pageable pageable,
    required String fieldBasedJSON,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "fieldBasedJSON": fieldBasedJSON,
    };

    // /rest/advancedGet/productInfoPage
    ApiResult<ProductInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/advancedGet/productInfoPage",
      queryParameters: queryParameters,
      converter: ProductInfoPage.fromJson,
    );
    return result;
  }
}
