import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class CdeRestProvider {
  // /rest/cde/cdeDiagram
  Future<ApiResult<CdeDiagram>> getCdeDiagram() async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/cde/cdeDiagram
    ApiResult<CdeDiagram> result = await flutterArtistDio.jsonGet(
      "/rest/cde/cdeDiagram",
      queryParameters: queryParameters,
      converter: CdeDiagram.fromJson,
    );
    return result;
  }

  // /rest/cde/cdeDiagram/$companyId
  Future<ApiResult<CdeDiagram>> getCdeDiagramByCompanyId(int companyId) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/cde/cdeDiagram/$companyId
    ApiResult<CdeDiagram> result = await flutterArtistDio.jsonGet(
      "/rest/cde/cdeDiagram/$companyId",
      queryParameters: queryParameters,
      converter: CdeDiagram.fromJson,
    );
    return result;
  }
}
