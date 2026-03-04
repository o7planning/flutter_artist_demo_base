import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class BestSellingRestProvider {
  // /rest/bestSelling/{days}
  Future<ApiResult<BestSellingDataPage>> query({
    required Pageable pageable,
    required int days,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
    };

    // /rest/bestSelling/${days}
    ApiResult<BestSellingDataPage> result = await flutterArtistDio.jsonGet(
      "/rest/bestSelling/$days",
      queryParameters: queryParameters,
      converter: BestSellingDataPage.fromJson,
    );
    return result;
  }

  // 10 Best Selling of all time.
  // /rest/bestSelling10
  Future<ApiResult<BestSellingDataPage>> query10BestSelling() async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/bestSelling
    ApiResult<BestSellingDataPage> result = await flutterArtistDio.jsonGet(
      "/rest/bestSelling10",
      queryParameters: queryParameters,
      converter: BestSellingDataPage.fromJson,
    );
    return result;
  }
}
