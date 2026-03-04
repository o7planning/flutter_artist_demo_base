part of '../model.dart';

@JsonSerializable()
class NotificationMessageDataPage
    extends PageDataImpl<NotificationMessageData> {
  NotificationMessageDataPage({
    required super.items,
    required super.paginationInfo,
  });

  factory NotificationMessageDataPage.fromJson(Map<String, dynamic> json) =>
      _$NotificationMessageDataPageFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationMessageDataPageToJson(this);
}
