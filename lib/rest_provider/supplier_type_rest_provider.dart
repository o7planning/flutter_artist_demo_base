import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class SupplierTypeRestProvider {
  // /rest/supplierTypeInfoPage/all
  Future<ApiResult<SupplierTypeInfoPage>> queryAll() async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/supplierTypeInfoPage/all
    ApiResult<SupplierTypeInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/supplierTypeInfoPage/all",
      queryParameters: queryParameters,
      converter: SupplierTypeInfoPage.fromJson,
    );
    return result;
  }
}
