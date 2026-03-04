import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';

class UrlDownloadHelper {
  Future<ApiResult<List<int>?>> downloadUrl(String url) async {
    ApiResult<List<int>?> result = await flutterArtistDio4Download.binaryGet(
      url,
    );
    return result;
  }
}
