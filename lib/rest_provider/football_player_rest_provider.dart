import 'package:dio/dio.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';
import '../model/uint8_list_file_data.dart';
import '../utils/date_utils.dart';

class FootballPlayerRestProvider {
  // /rest/footballPlayerInfoPage
  Future<ApiResult<FootballPlayerInfoPage>> query({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/footballPlayerInfoPage
    ApiResult<FootballPlayerInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/footballPlayerInfoPage",
      queryParameters: queryParameters,
      converter: FootballPlayerInfoPage.fromJson,
    );
    return result;
  }

  // /rest/footballPlayer/1
  Future<ApiResult<FootballPlayerData>> find({
    required int footballPlayerId,
  }) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/footballPlayer/1
    ApiResult<FootballPlayerData> result = await flutterArtistDio.jsonGet(
      "/rest/footballPlayer/$footballPlayerId",
      queryParameters: queryParameters,
      converter: FootballPlayerData.fromJson,
    );
    return result;
  }

  Future<ApiResult<void>> delete(int footballPlayerId) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/footballPlayer/delete/$footballPlayerId
    ApiResult<void> result = await flutterArtistDio.jsonDelete(
      "/rest/footballPlayer/delete/$footballPlayerId",
      queryParameters: queryParameters,
      converter: null,
    );
    return result;
  }

  Future<ApiResult<FootballPlayerData>> createFootballPlayer(
    Map<String, dynamic> formMapData,
  ) async {
    DateTime birthday = formMapData["birthday"];
    String birthdayStr = dateToString(birthday);
    //
    CountryInfo country = formMapData["country"];
    //
    List<dynamic>? xFiles = formMapData["xFiles"];
    XFile? xFile = xFiles?.firstOrNull;
    Uint8ListFileData? uint8ListFile = xFile == null
        ? null
        : await Uint8ListFileData.fromXFile(xFile);
    MultipartFile? multipartFile = uint8ListFile?.toMultipartFile();

    var formData = FormData.fromMap({
      "fullName": formMapData["fullName"],
      "birthday": birthdayStr, // yyyy-MM-dd
      "countryId": country.id,
      "description": formMapData["description"],
      "multipartFile": multipartFile,
    });

    // /rest/footballPlayer/create
    ApiResult<FootballPlayerData> result = await flutterArtistDio.jsonPost(
      "/rest/footballPlayer/create",
      queryParameters: null,
      data: formData,
      converter: FootballPlayerData.fromJson,
      showDebug: true,
    );
    return result;
  }

  Future<ApiResult<FootballPlayerData>> updateFootballPlayer(
    Map<String, dynamic> formMapData,
  ) async {
    DateTime birthday = formMapData["birthday"];
    String birthdayStr = dateToString(birthday);
    //
    CountryInfo country = formMapData["country"];
    //
    List<dynamic>? xFiles = formMapData["xFiles"];
    XFile? xFile = xFiles?.firstOrNull;
    Uint8ListFileData? uint8ListFile = xFile == null
        ? null
        : await Uint8ListFileData.fromXFile(xFile);
    MultipartFile? multipartFile = uint8ListFile?.toMultipartFile();

    var formData = FormData.fromMap({
      "id": formMapData["id"],
      "fullName": formMapData["fullName"],
      "birthday": birthdayStr, // yyyy-MM-dd
      "countryId": country.id,
      "description": formMapData["description"],
      "multipartFile": multipartFile,
    });

    // /rest/footballPlayer/update
    ApiResult<FootballPlayerData> result = await flutterArtistDio.jsonPut(
      "/rest/footballPlayer/update",
      queryParameters: null,
      data: formData,
      converter: FootballPlayerData.fromJson,
    );
    return result;
  }
}
