import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/widgets/single_youtube_video_player.dart';

import '../../../model/model.dart';
import '../../../widgets/image_url_view.dart';
import '../block/song02a_block.dart';

class Song02aItemDetailView extends BlockItemDetailView<Song02aBlock> {
  const Song02aItemDetailView({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    // Current ITEM_DETAIL:
    SongData? songData = block.currentItemDetail;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImageUrlView(
              imageUrl: songData?.imageUrl,
              size: 120,
              boxShape: BoxShape.rectangle,
              defaultOrErrorIconData: Icons.video_label_sharp,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(songData?.name ?? ' - '),
                  SizedBox(height: 10),
                  CheckboxListTile(
                    value: songData?.published ?? false,
                    onChanged: null,
                    title: Text("Published?"),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                  ),
                  CheckboxListTile(
                    value: songData?.locked ?? false,
                    onChanged: null,
                    title: Text("Locked?"),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          "Youtube Video Description: ${songData?.youtubeVideoInfo ?? ' - '}",
        ),
        SizedBox(height: 10),
        if (songData != null &&
            songData.youtubeCode != null &&
            songData.youtubeCode!.trim().isNotEmpty)
          Expanded(
            child: SizedBox(
              width: 320,
              height: 240,
              child: SingleYoutubeVideoPlayer(
                youtubeVideoId: songData.youtubeCode!,
                key: Key("Youtube-${songData.youtubeCode!}"),
              ),
            ),
          ),
      ],
    );
  }
}
