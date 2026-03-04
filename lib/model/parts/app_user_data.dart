part of '../model.dart';

@JsonSerializable()
class AppUserData implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @override
  @JsonKey(name: 'userName')
  late String userName;

  @JsonKey(name: 'fullName')
  late String fullName;

  @JsonKey(name: 'enabled')
  late bool enabled;

  @JsonKey(name: 'activated')
  late bool activated;

  @override
  @JsonKey(name: 'email')
  late String email;

  @JsonKey(name: 'employee')
  EmployeeData? employee;

  @JsonKey(name: 'lastActiveDatetime')
  String? lastActiveDatetime;

  @override
  @JsonKey(name: 'isSystemUser')
  bool isSystemUser;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  AppUserData(
    this.id,
    this.userName,
    this.fullName,
    this.enabled,
    this.activated,
    this.isSystemUser,
    this.imagePath,
    this.email,
    this.employee,
  );

  AppUserData.named({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.enabled,
    required this.activated,
    required this.isSystemUser,
    required this.email,
    required this.imagePath,
  });

  AppUserInfo toAppUserInfo() {
    return AppUserInfo.named(
      id: id,
      userName: userName,
      fullName: fullName,
      enabled: enabled,
      activated: activated,
      isSystemUser: isSystemUser,
      imagePath: imagePath,
    );
  }

  factory AppUserData.fromJson(Map<String, dynamic> json) =>
      _$AppUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $fullName)";
  }

  @override
  int? get expiresIn => null;

  @override
  String? get refreshToken => null;

  @override
  String? get scope => null;

  @override
  String? get tokenType => null;
}
