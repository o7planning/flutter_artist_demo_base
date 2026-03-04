import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class AlbumRestProvider {
  // /rest/albumInfoPage/all
  Future<ApiResult<AlbumInfoPage>> allAlbums() async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/albumInfoPage/all
    ApiResult<AlbumInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/albumInfoPage/all",
      queryParameters: queryParameters,
      converter: AlbumInfoPage.fromJson,
    );
    return result;
  }

  // /rest/albumInfoPage/search
  Future<ApiResult<AlbumInfoPage>> querySearch({
    required Pageable pageable,
    required String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/albumInfoPage/search
    ApiResult<AlbumInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/albumInfoPage/search",
      queryParameters: queryParameters,
      converter: AlbumInfoPage.fromJson,
    );
    return result;
  }

  // /rest/album/1
  Future<ApiResult<AlbumData>> find({required int albumId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/album/1
    ApiResult<AlbumData> result = await flutterArtistDio.jsonGet(
      "/rest/album/$albumId",
      queryParameters: queryParameters,
      converter: AlbumData.fromJson,
    );
    return result;
  }
}
