import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import '../../widgets/short_desc_view.dart';
import 'scalar/system_report70a_scalar.dart';
import 'scalar_value_view/system_report70a_value_view.dart';
import 'shelf/system_report70a_shelf.dart';

class SystemReport70aScreen extends MyFaceScreen {
  static const String routeName = "/system-report70a";

  const SystemReport70aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    SystemReport70aShelf shelf = FlutterArtist.storage.findShelf();
    final SystemReport70aScalar scalar = shelf.findSystemReport70aScalar();
    //
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ExampleOverviewBar(example: example_70a),
          SizedBox(height: 10),
          ShortDescView(shortDesc: "Simple Scalar Example."),
          SizedBox(height: 10),
          Expanded(child: SystemReport70aValueView(scalar: scalar)),
        ],
      ),
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Basic] SystemReport70a";
  }

  @override
  String getTopMenuSubtitle() {
    return "Scalar Example";
  }
}
