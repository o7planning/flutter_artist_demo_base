part of '../model.dart';

@JsonSerializable()
class ContributorInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'appUser')
  late AppUserInfo appUser;

  ContributorInfo(this.id, this.appUser);

  ContributorInfo.named({required this.id, required this.appUser});

  factory ContributorInfo.fromJson(Map<String, dynamic> json) =>
      _$ContributorInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ContributorInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}( ${appUser.userName})";
  }
}
