import 'package:dio/dio.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class LoginRestProvider {
  Future<ApiResult<LoggedInUserData>> login(
    String userNameOrEmail,
    String password,
  ) async {
    // Using Flutter DIO library (Not Get_connect).
    var formData = FormData.fromMap({
      "userNameOrEmail": userNameOrEmail,
      "password": password,
    });
    ApiResult<LoggedInUserData> result = await flutterArtistDio.jsonPost(
      "/rest/login",
      data: formData,
      converter: LoggedInUserData.fromJson,
    );
    return result;
  }

  Future<ApiResult<void>> logout() async {
    var formData = FormData.fromMap({});
    ApiResult<void> result = await flutterArtistDio.jsonPost(
      "/rest/logout",
      data: formData,
      converter: null,
    );
    return result;
  }
}
