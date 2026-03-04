import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class BookRestProvider {
  // /rest/bookInfoPage
  Future<ApiResult<BookInfoPage>> query({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/bookInfoPage
    ApiResult<BookInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/bookInfoPage",
      queryParameters: queryParameters,
      converter: BookInfoPage.fromJson,
    );
    return result;
  }

  // /rest/book/detail/1
  Future<ApiResult<BookDetailData>> find({required int bookId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/book/detail/1
    ApiResult<BookDetailData> result = await flutterArtistDio.jsonGet(
      "/rest/book/detail/$bookId",
      queryParameters: queryParameters,
      converter: BookDetailData.fromJson,
    );
    return result;
  }
}
