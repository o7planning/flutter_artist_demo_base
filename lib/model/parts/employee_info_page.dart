part of '../model.dart';

@JsonSerializable()
class EmployeeInfoPage extends PageDataImpl<EmployeeInfo> {
  EmployeeInfoPage({required super.items, required super.paginationInfo});

  factory EmployeeInfoPage.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeInfoPageToJson(this);
}
