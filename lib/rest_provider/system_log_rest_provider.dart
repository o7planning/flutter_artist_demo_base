import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';
import '../utils/date_utils.dart';

int _systemLogSeq = 1;

class SystemLogRestProvider {
  // /rest/systemLogInfoPage
  Future<ApiResult<SystemLogInfoPage>> query({
    required Pageable pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/systemLogInfoPage
    ApiResult<SystemLogInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/systemLogInfoPage",
      queryParameters: queryParameters,
      converter: SystemLogInfoPage.fromJson,
    );
    return result;
  }

  // /rest/systemLog/1
  Future<ApiResult<SystemLogData>> find({required int systemLogId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/systemLog/1
    ApiResult<SystemLogData> result = await flutterArtistDio.jsonGet(
      "/rest/systemLog/$systemLogId",
      queryParameters: queryParameters,
      converter: SystemLogData.fromJson,
    );
    return result;
  }

  Future<ApiResult<void>> delete(int systemLogId) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/systemLog/delete/systemLogId
    ApiResult<void> result = await flutterArtistDio.jsonDelete(
      "/rest/systemLog/delete/$systemLogId",
      queryParameters: queryParameters,
      converter: null,
    );
    return result;
  }

  Future<ApiResult<PageData<SystemLogInfo>>> createMultiSystemLogs() async {
    final int itemCount = 2;
    List<SystemLogInfo> list = [];
    for (int i = 0; i < itemCount; i++) {
      SystemLogInfo info = SystemLogInfo.named(
        id: _systemLogSeq,
        createDateTime: dateTimeToString(DateTime.now()),
        severity: "severity",
        content: "Test $_systemLogSeq",
      );
      list.add(info);
      _systemLogSeq++;
    }
    return ApiResult.success(data: PageData.ofItems(list));
  }
}
