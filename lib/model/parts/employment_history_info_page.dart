part of '../model.dart';

@JsonSerializable()
class EmploymentHistoryInfoPage extends PageDataImpl<EmploymentHistoryInfo> {
  EmploymentHistoryInfoPage({
    required super.items,
    required super.paginationInfo,
  });

  factory EmploymentHistoryInfoPage.fromJson(Map<String, dynamic> json) =>
      _$EmploymentHistoryInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$EmploymentHistoryInfoPageToJson(this);
}
