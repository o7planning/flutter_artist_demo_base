import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class EmployeePositionRestProvider {
  // /rest/employeePositionInfoPage/all
  Future<ApiResult<EmployeePositionInfoPage>> queryAll() async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/employeePositionInfoPage/all
    ApiResult<EmployeePositionInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/employeePositionInfoPage/all",
      queryParameters: queryParameters,
      converter: EmployeePositionInfoPage.fromJson,
    );
    return result;
  }
}
