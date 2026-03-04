import 'package:flutter_artist/flutter_artist.dart';

import '../block/currency49a_block.dart';

class Currency49aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {},
      blocks: [
        Currency49aBlock(
          name: Currency49aBlock.blkName,
          description: null,
          config: BlockConfig(clientSideSortStrategy: SortStrategy.manual),
          filterModelName: null,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  Currency49aBlock findCurrency49aBlock() {
    return findBlock(Currency49aBlock.blkName) as Currency49aBlock;
  }
}
