part of '../model.dart';

@JsonSerializable()
class ContributorInfoPage extends PageDataImpl<ContributorInfo> {
  ContributorInfoPage({required super.items, required super.paginationInfo});

  factory ContributorInfoPage.fromJson(Map<String, dynamic> json) =>
      _$ContributorInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$ContributorInfoPageToJson(this);
}
