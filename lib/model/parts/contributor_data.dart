part of '../model.dart';

@JsonSerializable()
class ContributorData extends ContributorInfo {
  ContributorData(super.id, super.appUser);

  factory ContributorData.fromJson(Map<String, dynamic> json) =>
      _$ContributorDataFromJson(json);

  Map<String, dynamic> toJson() => _$ContributorDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}(${appUser.userName})";
  }
}
