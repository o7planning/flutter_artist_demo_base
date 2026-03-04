import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../block/song02a_block.dart';
import '../widget/song02a_list_item.dart';

class Song02aListItemsView extends BlockItemsView<Song02aBlock> {
  const Song02aListItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: block.items
          .map(
            (item) => Song02aListItem(
              songInfo: item,
              selected: block.isCurrentItem(item),
              onSongPressed: _onSongPressed,
            ),
          )
          .toList(),
    );
  }

  void _onSongPressed(SongInfo songInfo) {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    block.refreshItemAndSetAsCurrent(item: songInfo, navigate: null);
  }
}
