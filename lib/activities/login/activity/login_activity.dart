import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../dashboard/dashboard_screen.dart';
import '../../../model/model.dart';
import '../../../rest_provider/login_rest_provider.dart';

class AppLoginActivity extends LoginActivity<LoggedInUserData> {
  final loginRestProvider = LoginRestProvider();

  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  AppLoginActivity();

  @override
  Future<ApiResult<LoggedInUserData>> performLogin() async {
    String userName = formKey.currentState?.instantValue["userName"]!;
    String password = formKey.currentState?.instantValue["password"]!;

    ApiResult<LoggedInUserData> result = await loginRestProvider.login(
      userName,
      password,
    );
    return result;
  }

  @override
  Future<void> navigateToSuccessScreen() async {
    await Get.offNamed(DashboardScreen.routeName);
  }
}
