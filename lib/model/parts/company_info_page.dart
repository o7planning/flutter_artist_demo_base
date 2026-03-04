part of '../model.dart';

@JsonSerializable()
class CompanyInfoPage extends PageDataImpl<CompanyInfo> {
  CompanyInfoPage({required super.items, required super.paginationInfo});

  factory CompanyInfoPage.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyInfoPageToJson(this);
}
