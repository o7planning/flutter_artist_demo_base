import 'package:flutter_artist/flutter_artist.dart';

import '../block/currency01a_block.dart';

class Currency01aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {},
      blocks: [
        Currency01aBlock(
          name: Currency01aBlock.blkName,
          description: null,
          config: BlockConfig(),
          filterModelName: null,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  Currency01aBlock findCurrency01aBlock() {
    return findBlock(Currency01aBlock.blkName) as Currency01aBlock;
  }
}
