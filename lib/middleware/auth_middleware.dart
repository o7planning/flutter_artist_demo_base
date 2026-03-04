import 'dart:async';

import 'package:flutter_artist/flutter_artist.dart';
import 'package:get/get.dart';

import '../activities/login/login_screen.dart';
import '../model/model.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int get priority => 0;

  @override
  FutureOr<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
    LoggedInUserData? user = FlutterArtist.loggedInUser as LoggedInUserData?;
    if (user == null) {
      return RouteDecoder.fromRoute(LoginScreen.routeName);
    }
    return super.redirectDelegate(route);
  }
}
