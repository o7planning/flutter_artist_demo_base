import 'package:flutter/material.dart';

import '../../layout/my_face_screen.dart';

class ConfigurationScreen extends MyFaceScreen {
  static const String routeName = "/configuration";

  const ConfigurationScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    return Text("Configuration");
  }

  @override
  String getTopMenuTitle() {
    return "Configuration";
  }
}
