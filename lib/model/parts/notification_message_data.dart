part of '../model.dart';

@JsonSerializable()
class NotificationMessageData implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'title')
  late String title;

  @JsonKey(name: 'createDateTime')
  late String createDateTime;

  @JsonKey(name: 'read')
  late bool read;

  @JsonKey(name: 'type')
  late String type;

  @JsonKey(name: 'message')
  late String message;

  NotificationMessageData({
    required this.id,
    required this.title,
    required this.createDateTime,
    required this.read,
    required this.type,
    required this.message,
  });

  factory NotificationMessageData.fromJson(Map<String, dynamic> json) =>
      _$NotificationMessageDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationMessageDataToJson(this);
}
