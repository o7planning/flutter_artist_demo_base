import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../../../widgets/image_url_view.dart';

class Song02aListItem extends StatelessWidget {
  final SongInfo songInfo;
  final bool selected;
  final Function(SongInfo songInfo) onSongPressed;

  const Song02aListItem({
    super.key,
    required this.songInfo,
    required this.selected,
    required this.onSongPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Colors.indigo.withAlpha(30) : null,
      child: ListTile(
        leading: ImageUrlView(
          imageUrl: songInfo.imageUrl,
          size: 60,
          boxShape: BoxShape.rectangle,
          defaultOrErrorIconData: Icons.video_camera_back_outlined,
        ),
        title: Text(
          songInfo.name,
          style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
        ),
        subtitle: Text(
          "${songInfo.published}",
          style: const TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
        ),
        onTap: _onTap,
      ),
    );
  }

  void _onTap() {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    onSongPressed(songInfo);
  }
}
