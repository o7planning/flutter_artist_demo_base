part of '../model.dart';

@JsonSerializable()
class SystemLogInfoPage extends PageDataImpl<SystemLogInfo> {
  SystemLogInfoPage({required super.items, required super.paginationInfo});

  factory SystemLogInfoPage.fromJson(Map<String, dynamic> json) =>
      _$SystemLogInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$SystemLogInfoPageToJson(this);
}
