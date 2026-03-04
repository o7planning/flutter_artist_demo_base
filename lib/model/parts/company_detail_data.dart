part of '../model.dart';

@JsonSerializable()
class CompanyExtData extends CompanyData {
  @JsonKey(name: 'departments', defaultValue: [])
  List<DepartmentData> departments = [];

  CompanyExtData(super.id, super.code, super.name);

  factory CompanyExtData.fromJson(Map<String, dynamic> json) =>
      _$CompanyExtDataFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyExtDataToJson(this);
}
