import 'package:dio/dio.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';
import '../model/uint8_list_file_data.dart';
import '../utils/date_utils.dart';

class CustomerRestProvider {
  // /rest/customerInfoPage/all
  Future<ApiResult<CustomerInfoPage>> queryAll() async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/customerInfoPage/all
    ApiResult<CustomerInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/customerInfoPage/all",
      queryParameters: queryParameters,
      converter: CustomerInfoPage.fromJson,
    );
    return result;
  }

  // /rest/customerInfoPage
  Future<ApiResult<CustomerInfoPage>> query({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/customerInfoPage
    ApiResult<CustomerInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/customerInfoPage",
      queryParameters: queryParameters,
      converter: CustomerInfoPage.fromJson,
    );
    return result;
  }

  // /rest/customer/1
  Future<ApiResult<CustomerData>> find({required int customerId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/customer/1
    ApiResult<CustomerData> result = await flutterArtistDio.jsonGet(
      "/rest/customer/$customerId",
      queryParameters: queryParameters,
      converter: CustomerData.fromJson,
    );
    return result;
  }

  Future<ApiResult<CustomerData>> createCustomer(
    Map<String, dynamic> formMapData,
  ) async {
    DateTime birthday = formMapData["birthday"];
    DateTime hireDate = formMapData["hireDate"];

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
      "multipartFile": multipartFile,
    });

    // /rest/customer/create
    ApiResult<CustomerData> result = await flutterArtistDio.jsonPost(
      "/rest/customer/create",
      queryParameters: null,
      data: formData,
      converter: CustomerData.fromJson,
      showDebug: true,
    );
    return result;
  }

  Future<ApiResult<CustomerData>> updateCustomer(
    Map<String, dynamic> formMapData,
  ) async {
    DateTime birthday = formMapData["birthday"];
    DateTime hireDate = formMapData["hireDate"];

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
      "multipartFile": multipartFile,
    });

    // /rest/customer/update
    ApiResult<CustomerData> result = await flutterArtistDio.jsonPut(
      "/rest/customer/update",
      queryParameters: null,
      data: formData,
      converter: CustomerData.fromJson,
    );
    return result;
  }

  Future<ApiResult<void>> delete(int customerId) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/customer/delete/customerId
    ApiResult<void> result = await flutterArtistDio.jsonDelete(
      "/rest/customer/delete/$customerId",
      queryParameters: queryParameters,
      converter: null,
    );
    return result;
  }

  Future<ApiResult<CustomerData>> updateVip({
    required int customerId,
    required bool vip,
  }) async {
    var formData = FormData.fromMap({"id": customerId, "vip": vip});

    // /rest/customer/updateVip
    ApiResult<CustomerData> result = await flutterArtistDio.jsonPut(
      "/rest/customer/updateVip",
      queryParameters: null,
      data: formData,
      converter: CustomerData.fromJson,
    );
    return result;
  }

  Future<ApiResult<CustomerData>> updateCode({
    required int customerId,
    required String code,
  }) async {
    var formData = FormData.fromMap({"id": customerId, "code": code});

    // /rest/customer/updateCode
    ApiResult<CustomerData> result = await flutterArtistDio.jsonPut(
      "/rest/customer/updateCode",
      queryParameters: null,
      data: formData,
      converter: CustomerData.fromJson,
    );
    return result;
  }
}
