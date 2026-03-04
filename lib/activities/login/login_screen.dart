import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import 'activity/login_activity.dart';
import 'section/login_section.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLoginActivity loginActivity = FlutterArtist.storage.findActivity();
    //
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 300,
          height: 360,
          child: LoginSection(loginActivity: loginActivity),
        ),
      ),
    );
  }
}
