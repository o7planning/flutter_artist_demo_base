import 'dart:convert';

import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class LoginLogoutAdapterImpl implements ILoginLogoutAdapter {
  @override
  ILoggedInUser? fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return LoggedInUserData.fromJson(map);
  }

  @override
  String toJson(ILoggedInUser loggedInUserData) {
    LoggedInUserData data = loggedInUserData as LoggedInUserData;
    Map<String, dynamic> map = data.toJson();
    return jsonEncode(map);
  }

  @override
  void addThirdPartyLogicOnLogin(ILoggedInUser loggedInUser) {
    // LoggedInUserData implements OAuth2Token (fresh_dio):
    LoggedInUserData token = loggedInUser as LoggedInUserData;
    fresh.setToken(token);
  }

  @override
  void addThirdPartyLogicOnLogout() {
    fresh.setToken(null);
  }
}
