import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class SongRestProvider {
  // /rest/songInfoPage/search
  Future<ApiResult<SongInfoPage>> querySearch({
    required Pageable pageable,
    required String? searchText,
    required int? albumId,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
      "albumId": albumId,
    };

    // /rest/songInfoPage/search
    ApiResult<SongInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/songInfoPage/search",
      queryParameters: queryParameters,
      converter: SongInfoPage.fromJson,
    );
    return result;
  }

  // /rest/song/1
  Future<ApiResult<SongData>> find({required int songId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/song/1
    ApiResult<SongData> result = await flutterArtistDio.jsonGet(
      "/rest/song/$songId",
      queryParameters: queryParameters,
      converter: SongData.fromJson,
    );
    return result;
  }
}
