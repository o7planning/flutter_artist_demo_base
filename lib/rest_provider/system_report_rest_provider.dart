import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class SystemReportRestProvider {
  // /rest/systemReport
  Future<ApiResult<SystemReportData>> query() async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/systemReport
    ApiResult<SystemReportData> result = await flutterArtistDio.jsonGet(
      "/rest/systemReport",
      queryParameters: queryParameters,
      converter: SystemReportData.fromJson,
    );
    return result;
  }
}
