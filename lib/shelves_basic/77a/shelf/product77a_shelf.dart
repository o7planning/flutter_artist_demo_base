import 'package:flutter_artist/flutter_artist.dart';

import '../block/product77a_block.dart';
import '../filter_model/product77a_filter_model.dart';

class Product77aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {Product77aFilterModel.filterName: Product77aFilterModel()},
      blocks: [
        Product77aBlock(
          name: Product77aBlock.blkName,
          description: null,
          config: BlockConfig(),
          filterModelName: Product77aFilterModel.filterName,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  Product77aFilterModel findProduct77aFilterModel() {
    return findFilterModel(Product77aFilterModel.filterName)
        as Product77aFilterModel;
  }

  Product77aBlock findProduct77aBlock() {
    return findBlock(Product77aBlock.blkName) as Product77aBlock;
  }
}
