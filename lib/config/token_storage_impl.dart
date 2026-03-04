import 'package:flutter_artist/flutter_artist.dart';
import 'package:fresh_dio/fresh_dio.dart';

import '../model/model.dart';

class TokenStorageImpl implements TokenStorage<LoggedInUserData> {
  @override
  Future<LoggedInUserData?> read() async {
    LoggedInUserData? user = FlutterArtist.loggedInUser as LoggedInUserData?;
    return user;
  }

  @override
  Future<void> write(LoggedInUserData token) async {
    await FlutterArtist.setOrUpdateLoggedInUser(token);
  }

  @override
  Future<void> delete() async {
    await FlutterArtist.removeStoredLoggedInUser();
  }
}
