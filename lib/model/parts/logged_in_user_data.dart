part of '../model.dart';

@JsonSerializable()
class LoggedInUserData implements ILoggedInUser, OAuth2Token {
  @JsonKey(name: 'appUser')
  AppUserData appUser;

  @override // for OAuth2Token
  @JsonKey(name: 'accessToken')
  String accessToken;

  @override // for OAuth2Token
  @JsonKey(name: "expiresIn")
  int? expiresIn;

  @override // for OAuth2Token
  @JsonKey(name: "refreshToken")
  String? refreshToken;

  @override // for OAuth2Token
  @JsonKey(name: "scope")
  String? scope;

  @override // for OAuth2Token
  @JsonKey(name: "tokenType")
  String? tokenType;

  // Ignore
  @override // for ILoggedInUser
  @JsonKey(includeFromJson: true)
  String get email => appUser.email;

  // Ignore
  @override // for ILoggedInUser
  @JsonKey(includeFromJson: true)
  bool get isSystemUser => appUser.isSystemUser;

  // Ignore
  @override // for ILoggedInUser
  @JsonKey(includeFromJson: true)
  String get userName => appUser.userName;

  LoggedInUserData(
    this.appUser,
    this.accessToken,
    this.expiresIn,
    this.refreshToken,
    this.scope,
    this.tokenType,
  );

  LoggedInUserData.named({
    required this.appUser,
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.scope,
    required this.tokenType,
  });

  factory LoggedInUserData.fromJson(Map<String, dynamic> json) =>
      _$LoggedInUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoggedInUserDataToJson(this);

  @override
  DateTime? get expiresAt => null;

  @override
  DateTime? get issuedAt => null;
}
