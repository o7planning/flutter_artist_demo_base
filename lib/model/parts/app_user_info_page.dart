part of '../model.dart';

@JsonSerializable()
class AppUserInfoPage extends PageDataImpl<AppUserInfo> {
  AppUserInfoPage({required super.items, required super.paginationInfo});

  factory AppUserInfoPage.fromJson(Map<String, dynamic> json) =>
      _$AppUserInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserInfoPageToJson(this);
}
