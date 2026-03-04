import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';

///
/// This simple class helps to play youtube videos on Flutter.
/// In reality you should use better libraries like youtube_player_flutter
///
class SimpleHtmlYoutubeIframe extends StatelessWidget {
  final double width;
  final double height;
  final String youtubeCode;

  const SimpleHtmlYoutubeIframe({
    required this.youtubeCode,
    required this.width,
    required this.height,
    required super.key,
  });

  @override
  Widget build(BuildContext context) {
    String content =
        '<iframe src="https://www.youtube.com/embed/$youtubeCode"></iframe>';

    return SizedBox(
      height: height,
      width: width,
      child: HtmlWidget(
        content,
        factoryBuilder: () => _YoutubeIframeWidgetFactory(),
      ),
    );
  }
}

class _YoutubeIframeWidgetFactory extends WidgetFactory with WebViewFactory {
  @override
  bool get webViewMediaPlaybackAlwaysAllow => true;

  @override
  String? get webViewUserAgent => 'Flutter Artist';
}
