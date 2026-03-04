import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SingleYoutubeVideoPlayer extends StatefulWidget {
  final String youtubeVideoId;

  const SingleYoutubeVideoPlayer({required this.youtubeVideoId, super.key});

  @override
  State<StatefulWidget> createState() {
    return _SingleYoutubeVideoPlayerState();
  }
}

class _SingleYoutubeVideoPlayerState extends State<SingleYoutubeVideoPlayer> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.youtubeVideoId,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(controller: _controller, aspectRatio: 16 / 9);
  }
}
