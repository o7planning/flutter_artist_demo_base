import 'package:flutter/material.dart';

import '../../layout/my_face_screen.dart';
import '../example/widgets/dashboard_section.dart';
import '../example/widgets/example_model.dart';

abstract class BaseExamplesScreen extends MyFaceScreen {
  const BaseExamplesScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height - 80,
          child: DashboardSection(exampleList: getExampleList()),
        ),
      ],
    );
  }

  List<Example> getExampleList();

  @override
  String getTopMenuTitle() {
    return "Basic Examples";
  }
}
