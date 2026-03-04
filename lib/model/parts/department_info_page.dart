part of '../model.dart';

@JsonSerializable()
class DepartmentInfoPage extends PageDataImpl<DepartmentInfo> {
  DepartmentInfoPage({required super.items, required super.paginationInfo});

  factory DepartmentInfoPage.fromJson(Map<String, dynamic> json) =>
      _$DepartmentInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentInfoPageToJson(this);
}
