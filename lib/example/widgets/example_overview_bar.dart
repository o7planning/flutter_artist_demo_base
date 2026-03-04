import 'package:flutter/material.dart';
import 'package:flutter_artist_demo_base/widgets/custom_app_container.dart';

import 'example_const.dart';
import 'example_dialog.dart';
import 'example_model.dart';
import 'example_overview_tab.dart';

class ExampleOverviewBar extends StatelessWidget {
  final Example example;

  const ExampleOverviewBar({required this.example, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      padding: EdgeInsets.all(5),
      width: double.maxFinite,
      child: Row(
        children: [
          TextButton.icon(
            icon: Icon(exampleIconDataObjective),
            label: Text("Objective"),
            onPressed: () {
              _openDocumentsDialog(context, ExampleOverviewTab.objectiveDoc);
            },
          ),
          TextButton.icon(
            icon: Icon(exampleIconDataImage),
            label: Text("Gif"),
            onPressed: () {
              _openDocumentsDialog(context, ExampleOverviewTab.image);
            },
          ),
          TextButton.icon(
            icon: Icon(exampleIconDataVideo),
            label: Text("Video"),
            onPressed: example.youtubeVideoCode != null
                ? () {
                    _openDocumentsDialog(context, ExampleOverviewTab.video);
                  }
                : null,
          ),
          Spacer(),
          if (example.documentId != null)
            TextButton.icon(
              icon: Icon(exampleIconDataArticle),
              label: Text("Docs"),
              onPressed: () {
                example.showArticle();
              },
            ),
        ],
      ),
    );
  }

  Future<void> _openDocumentsDialog(
    BuildContext context,
    ExampleOverviewTab exampleOverviewTab,
  ) async {
    await openExampleDialog(
      context,
      example: example,
      exampleOverviewTab: exampleOverviewTab,
    );
  }
}
