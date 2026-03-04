part of '../model.dart';

@JsonSerializable()
class EmployeePositionInfoPage extends PageDataImpl<EmployeePositionInfo> {
  EmployeePositionInfoPage({
    required super.items,
    required super.paginationInfo,
  });

  factory EmployeePositionInfoPage.fromJson(Map<String, dynamic> json) =>
      _$EmployeePositionInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeePositionInfoPageToJson(this);
}
