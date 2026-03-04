import 'package:flutter/material.dart';

import '../../layout/my_face_screen.dart';

class DashboardScreen extends MyFaceScreen {
  static const String routeName = "/dashboard";

  const DashboardScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [SizedBox(height: height - 80, child: Text("OK"))],
    );
  }

  @override
  String getTopMenuTitle() {
    return "Dashboard";
  }
}
