import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/widgets/example_dialog.dart';

import '../../widgets/no_padding_icon_button.dart';
import 'example_const.dart';
import 'example_model.dart';
import 'example_overview_tab.dart';

class ExampleBox extends StatelessWidget {
  final int exampleNo;
  final Example example;
  final bool selected;
  final Function(Example example) onSelectExample;

  const ExampleBox({
    required this.exampleNo,
    required this.example,
    required this.selected,
    required this.onSelectExample,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: example.shelfObjectType.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const Divider(height: 4, color: Colors.grey, thickness: 0.5),
          Expanded(child: _buildDescriptionSection()),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      dense: true,
      visualDensity: VisualDensity(vertical: -1, horizontal: -1),
      leading: InkWell(
        onTap: _showExample,
        child: Tooltip(
          message: example.shelfObjectType.description,
          child: CircleAvatar(
            radius: 24,
            backgroundColor: selected ? Colors.blue.withAlpha(100) : null,
            child: Text(
              exampleNo.toString(),
              maxLines: 1,
              style: TextStyle(
                fontSize: 14,
                color: example.documentId == null ? Colors.black : Colors.red,
                fontWeight: example.documentId == null
                    ? FontWeight.normal
                    : FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
      title: Tooltip(
        message: example.todo && example.todoDesc != null
            ? "TODO: ${example.todoDesc}"
            : "",
        child: Text(
          example.shelfType.toString(),
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: example.todo ? Colors.red : Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),
      ),
      subtitle: _buildFooter(context),
    );
  }

  Widget _buildDescriptionSection() {
    String description = example.description ?? "";
    Widget child = Text(
      example.description ?? " - ",
      maxLines: 3,
      style: TextStyle(fontSize: 11.5),
    );
    //
    return Padding(
      padding: EdgeInsets.all(5),
      child: description.length > 60
          ? Tooltip(message: description, child: child)
          : child,
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(height: 10, thickness: 0.5),
        Wrap(
          spacing: 10,
          children: [
            NoPaddingIconButton(
              icon: Icon(exampleIconDataObjective, size: 14),
              onPressed: () {
                _openDocumentDialog(context);
              },
            ),
            NoPaddingIconButton(
              icon: Icon(exampleIconDataImage, size: 14),
              onPressed: () {
                _openGifImageDialog(context);
              },
            ),
            NoPaddingIconButton(
              icon: Icon(exampleIconDataVideo, size: 14),
              onPressed: example.youtubeVideoCode != null
                  ? () {
                      _openVideoDialog(context);
                    }
                  : null,
            ),
            NoPaddingIconButton(
              icon: Icon(exampleIconDataView, size: 14),
              onPressed: _showExample,
            ),
            if (example.documentId != null)
              Tooltip(
                message: "Document: ${example.documentId!}",
                child: NoPaddingIconButton(
                  icon: Icon(
                    exampleIconDataArticle,
                    size: 14,
                    color: example.documentReady ? Colors.indigo : Colors.red,
                  ),
                  onPressed: example.showArticle,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Future<void> _openDocumentDialog(BuildContext context) async {
    onSelectExample(example);
    //
    await openExampleDialog(
      context,
      example: example,
      exampleOverviewTab: ExampleOverviewTab.objectiveDoc,
    );
  }

  Future<void> _openGifImageDialog(BuildContext context) async {
    onSelectExample(example);
    //
    await openExampleDialog(
      context,
      example: example,
      exampleOverviewTab: ExampleOverviewTab.image,
    );
  }

  Future<void> _openVideoDialog(BuildContext context) async {
    onSelectExample(example);
    //
    await openExampleDialog(
      context,
      example: example,
      exampleOverviewTab: ExampleOverviewTab.video,
    );
  }

  void _showExample() {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: {},
    );
    //
    onSelectExample(example);
    //
    example.showExample();
  }
}
