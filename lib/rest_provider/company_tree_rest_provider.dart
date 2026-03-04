import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class CompanyTreeRestProvider {
  // /rest/company/companyTree
  Future<ApiResult<CompanyTree>> getCompanyTree() async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/company/companyTree
    ApiResult<CompanyTree> result = await flutterArtistDio.jsonGet(
      "/rest/company/companyTree",
      queryParameters: queryParameters,
      converter: CompanyTree.fromJson,
    );
    return result;
  }
}
