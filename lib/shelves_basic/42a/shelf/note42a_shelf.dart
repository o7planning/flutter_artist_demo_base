import 'package:flutter_artist/flutter_artist.dart';

import '../block/note42a_block.dart';

class Note42aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {},
      blocks: [
        Note42aBlock(
          name: Note42aBlock.blkName,
          description: null,
          config: BlockConfig(),
          filterModelName: null,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  Note42aBlock findNote42aBlock() {
    return findBlock(Note42aBlock.blkName) as Note42aBlock;
  }
}
