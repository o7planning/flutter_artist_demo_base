import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import 'block/song02a_block.dart';
import 'block_item_detail_view/song02a_item_detail_view.dart';
import 'block_items_view/song02a_list_items_view.dart';
import 'filter_model/song02a_filter_model.dart';
import 'filter_panel/song02a_filter_panel.dart';
import 'shelf/song02a_shelf.dart';

class Song02aScreen extends MyFaceScreen {
  static const String routeName = "/song02a";

  const Song02aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    Song02aShelf shelf = FlutterArtist.storage.findShelf();
    Song02aBlock songBlock = shelf.findSong02aBlock();
    Song02aFilterModel song02aFilterModel = shelf.findSong02aFilterModel();

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LeftRightContainer(
        spacing: 20,
        arrowTopPosition: 35,
        fixedSizeWidth: 300,
        minSideWidth: 320,

        autoShowTwoSidesIfPossible: true,
        start: _buildLeft(song02aFilterModel, songBlock),
        end: _buildRight(songBlock),
      ),
    );
  }

  Widget _buildRight(Song02aBlock songBlock) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExampleOverviewBar(example: example_song02a),
        SizedBox(height: 10),
        //
        // BlockControlBar can automatically refresh when Block changes.
        //
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: songBlock,
          config: BlockControlBarConfig(
            allowRefreshButton: true,
            allowQueryButton: true,
            allowCreateButton: false,
            allowSaveButton: false,
            allowDeleteButton: false,
            allowBackButton: false,
            allowDebugFormModelViewerButton: false,
            allowDebugFilterCriteriaViewerButton: true,
          ),
        ),
        SizedBox(height: 10),
        Expanded(child: Song02aItemDetailView(block: songBlock)),
      ],
    );
  }

  Widget _buildLeft(
    Song02aFilterModel song02aFilterModel,
    Song02aBlock songBlock,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Song02aFilterPanel(filterModel: song02aFilterModel),
        SizedBox(height: 10),
        Expanded(child: Song02aListItemsView(block: songBlock)),
      ],
    );
  }

  @override
  String getTopMenuTitle() {
    return "[Filter] Song02a";
  }

  @override
  String getTopMenuSubtitle() {
    return "Using FilterModel, FilterCriteria";
  }
}
