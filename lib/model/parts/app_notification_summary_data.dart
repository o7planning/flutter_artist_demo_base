part of '../model.dart';

@JsonSerializable()
class AppNotificationSummaryData implements INotificationSummary {
  @JsonKey(name: 'unread')
  int unread = 0;

  AppNotificationSummaryData();

  factory AppNotificationSummaryData.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationSummaryDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppNotificationSummaryDataToJson(this);
}
