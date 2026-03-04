part of '../model.dart';

@JsonSerializable()
class SystemLogData implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'createDateTime')
  late String createDateTime;

  @JsonKey(name: 'severity')
  late String severity;

  @JsonKey(name: 'content')
  late String content;

  SystemLogData(this.id, this.createDateTime, this.severity, this.content);

  SystemLogData.named({
    required this.id,
    required this.createDateTime,
    required this.severity,
    required this.content,
  });

  SystemLogInfo toSystemLogInfo() {
    return SystemLogInfo.named(
      id: id,
      createDateTime: createDateTime,
      severity: severity,
      content: content,
    );
  }

  factory SystemLogData.fromJson(Map<String, dynamic> json) =>
      _$SystemLogDataFromJson(json);

  Map<String, dynamic> toJson() => _$SystemLogDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $content)";
  }
}
