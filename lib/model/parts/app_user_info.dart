part of '../model.dart';

@JsonSerializable()
class AppUserInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'userName')
  late String userName;

  @JsonKey(name: 'fullName')
  late String fullName;

  @JsonKey(name: 'enabled')
  late bool enabled;

  @JsonKey(name: 'activated')
  late bool activated;

  @JsonKey(name: 'isSystemUser')
  bool isSystemUser;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  AppUserInfo(
    this.id,
    this.userName,
    this.fullName,
    this.enabled,
    this.activated,
    this.isSystemUser,
    this.imagePath,
  );

  AppUserInfo.named({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.enabled,
    required this.activated,
    required this.isSystemUser,
    required this.imagePath,
  });

  factory AppUserInfo.fromJson(Map<String, dynamic> json) =>
      _$AppUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $fullName)";
  }
}
