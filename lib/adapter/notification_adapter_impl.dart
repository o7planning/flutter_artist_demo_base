import 'dart:convert';

import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../model/model.dart';

class NotificationAdapterImpl implements FlutterArtistNotificationAdapter {
  @override
  Future<ApiResult<INotificationSummary>>
  performLoadNotificationSummary() async {
    //
    // NOTE: See tutorial to implement Notification.
    //
    return ApiResult<INotificationSummary>.success(data: null);
  }

  @override
  String toJson(INotificationSummary notificationSummary) {
    notificationSummary as AppNotificationSummaryData;
    Map<String, dynamic> map = notificationSummary.toJson();
    return jsonEncode(map);
  }

  @override
  INotificationSummary? fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return AppNotificationSummaryData.fromJson(map);
  }

  @override
  Future<ApiResult<INotification>> performLoadNotifications() async {
    //
    // NOTE: See tutorial to implement Notification.
    //
    AppNotificationSummaryData empty = AppNotificationSummaryData();
    return ApiResult<INotification>.success(data: null);
  }
}
