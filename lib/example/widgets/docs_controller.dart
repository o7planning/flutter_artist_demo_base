import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

class DocsController extends GetxController {
  final Map<String, String> map = {};

  String? styleContent;
  String? currentContent;

  ///
  Future<String> _loadHelpContent(String htmlFileName) async {
    String assetFilePath = "static-rs/docs/$htmlFileName";
    //
    if (map.containsKey(assetFilePath)) {
      return map[assetFilePath]!;
    }
    String content;
    try {
      content = await rootBundle.loadString(assetFilePath);
    } catch (e) {
      content = "File not found: $assetFilePath";
    }
    if (styleContent == null) {
      await _loadStyleContent();
    }
    content = "<style>${styleContent!}</style>\n$content";

    map[assetFilePath] = content;
    return content;
  }

  Future<void> _loadStyleContent() async {
    if (styleContent == null) {
      try {
        styleContent = await rootBundle.loadString("static-rs/docs/_style.css");
      } catch (e) {
        styleContent = "";
      }
    }
  }

  ///
  /// @keyword: "single_okr.company" ==> return content of file "single_okr.company.html".
  ///
  Future<void> showHelp(String keyword) async {
    currentContent = await _loadHelpContent(keyword);
    update();
  }
}
