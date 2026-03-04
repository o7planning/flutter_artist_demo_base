import 'package:flutter_artist/flutter_artist.dart';

import '../block/song02a_block.dart';
import '../filter_model/song02a_filter_model.dart';

class Song02aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {
        Song02aFilterModel.filterName: Song02aFilterModel(), //
      },
      blocks: [
        Song02aBlock(
          name: Song02aBlock.blkName,
          description: null,
          config: BlockConfig(),
          filterModelName: Song02aFilterModel.filterName,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  Song02aBlock findSong02aBlock() {
    return findBlock(Song02aBlock.blkName) as Song02aBlock;
  }

  Song02aFilterModel findSong02aFilterModel() {
    return findFilterModel(Song02aFilterModel.filterName) as Song02aFilterModel;
  }
}
