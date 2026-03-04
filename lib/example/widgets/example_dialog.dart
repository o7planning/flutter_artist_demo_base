import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_artist_demo_base/widgets/custom_app_container.dart';
import 'package:flutter_artist_demo_base/widgets/single_youtube_video_player.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../widgets/no_padding_icon_button.dart';
import 'example_const.dart';
import 'example_model.dart';
import 'example_overview_tab.dart';

//
// String assetHtmlFilePath >> String content.
//
final Map<String, String> _docsMap = {};
String? _styleContent;

class ExampleDialog extends StatefulWidget {
  final Example example;
  final ExampleOverviewTab exampleOverviewTab;

  const ExampleDialog({
    required this.example,
    required this.exampleOverviewTab,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _ExampleDialogState();
  }
}

class _ExampleDialogState extends State<ExampleDialog> {
  late ExampleOverviewTab _exampleOverviewTab;
  String _htmlContent = "";

  @override
  void initState() {
    super.initState();
    //
    _exampleOverviewTab = widget.exampleOverviewTab;
    _readHtmlContent();
  }

  Future<void> _readHtmlContent() async {
    _htmlContent = await _loadHtmlContent(widget.example.htmlFileName);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = calculatePreferredDialogSize(
      context,
      preferredWidth: 800,
      preferredHeight: 520,
    );
    //
    FaAlertDialog dialog = FaAlertDialog(
      titleText: "Example Overview (${widget.example.shelfType})",
      icon: Icon(Icons.featured_play_list_outlined),
      contentPadding: EdgeInsets.all(5),
      content: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildControlBar(context),
            SizedBox(height: 10),
            Expanded(
              child: CustomAppContainer(
                width: double.maxFinite,
                child: _buildContent(context),
              ),
            ),
          ],
        ),
      ),
    );
    //
    return dialog;
  }

  Widget _buildControlBar(BuildContext context) {
    return CustomAppContainer(
      width: double.maxFinite,
      padding: EdgeInsets.all(5),
      child: Wrap(
        spacing: 10,
        children: [
          NoPaddingIconButton(
            icon: Icon(exampleIconDataObjective, size: 16),
            onPressed: () {
              setState(() {
                _exampleOverviewTab = ExampleOverviewTab.objectiveDoc;
              });
            },
          ),
          NoPaddingIconButton(
            icon: Icon(exampleIconDataImage, size: 16),
            onPressed: () {
              setState(() {
                _exampleOverviewTab = ExampleOverviewTab.image;
              });
            },
          ),
          NoPaddingIconButton(
            icon: Icon(exampleIconDataVideo, size: 16),
            onPressed: widget.example.youtubeVideoCode != null
                ? () {
                    setState(() {
                      _exampleOverviewTab = ExampleOverviewTab.video;
                    });
                  }
                : null,
          ),
          NoPaddingIconButton(
            icon: Icon(exampleIconDataView, size: 16),
            onPressed: _showExample,
          ),
        ],
      ),
    );
  }

  int _getSelectedIndex() {
    switch (_exampleOverviewTab) {
      case ExampleOverviewTab.objectiveDoc:
        return 0;
      case ExampleOverviewTab.image:
        return 1;
      case ExampleOverviewTab.video:
        return 2;
    }
  }

  Widget _buildContent(BuildContext context) {
    return IndexedStack(
      index: _getSelectedIndex(),
      children: [
        SingleChildScrollView(child: HtmlWidget(_htmlContent)),
        _buildGifImage(),
        _buildVideo(),
      ],
    );
  }

  Widget _buildVideo() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.black),
      child: widget.example.youtubeVideoCode == null
          ? SizedBox()
          : Center(
              child: SingleYoutubeVideoPlayer(
                youtubeVideoId: widget.example.youtubeVideoCode!,
              ),
            ),
    );
  }

  Widget _buildGifImage() {
    return Image.asset("static-rs/gifs/${widget.example.gifFileName}");
  }

  Future<String> _loadHtmlContent(String htmlFileName) async {
    String assetFilePath = "static-rs/docs/$htmlFileName";
    //
    if (_docsMap.containsKey(assetFilePath)) {
      return _docsMap[assetFilePath]!;
    }
    String content;
    try {
      content = await rootBundle.loadString(assetFilePath);
    } catch (e) {
      content = "File not found: $assetFilePath";
    }
    //
    _styleContent ??= await _loadStyleContent();
    content = "<style>${_styleContent!}</style>\n$content";

    _docsMap[assetFilePath] = content;
    return content;
  }

  Future<String> _loadStyleContent() async {
    try {
      return await rootBundle.loadString("static-rs/docs/_style.css");
    } catch (e) {
      return "";
    }
  }

  Future<void> _showExample() async {
    Get.closeAllDialogs();
    await widget.example.showExample();
  }
}

Future<void> openExampleDialog(
  BuildContext context, {
  required Example example,
  required ExampleOverviewTab exampleOverviewTab,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return ExampleDialog(
        example: example,
        exampleOverviewTab: exampleOverviewTab,
      );
    },
  );
}
