import 'package:flutter_artist/flutter_artist.dart';

import '../block/system_log25a_block.dart';

class SystemLog25aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {},
      blocks: [
        SystemLog25aBlock(
          name: SystemLog25aBlock.blkName,
          description: null,
          config: BlockConfig(),
          filterModelName: null,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  SystemLog25aBlock findSystemLog25aBlock() {
    return findBlock(SystemLog25aBlock.blkName) as SystemLog25aBlock;
  }
}
