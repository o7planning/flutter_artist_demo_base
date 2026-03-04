import 'package:flutter_artist/flutter_artist.dart';

import '../block/category08a_block.dart';
import '../block/product08a_block.dart';

class CatProduct08aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      description: null,
      filterModels: {},
      blocks: [
        Category08aBlock(
          name: Category08aBlock.blkName,
          description: null,
          config: BlockConfig(),
          filterModelName: null,
          formModel: null,
          childBlocks: [
            Product08aBlock(
              name: Product08aBlock.blkName,
              description: null,
              config: BlockConfig(),
              filterModelName: null,
              formModel: null,
              childBlocks: [],
            ),
          ],
        ),
      ],
    );
  }

  Category08aBlock findCategory08aBlock() {
    return findBlock(Category08aBlock.blkName) as Category08aBlock;
  }

  Product08aBlock findProduct08aBlock() {
    return findBlock(Product08aBlock.blkName) as Product08aBlock;
  }
}
