import 'package:flutter_artist/flutter_artist.dart';

import '../block/supplier11a_block.dart';
import '../form_model/supplier11a_form_model.dart';

class Supplier11aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {},
      blocks: [
        Supplier11aBlock(
          name: Supplier11aBlock.blkName,
          description: null,
          config: BlockConfig(),
          filterModelName: null,
          formModel: Supplier11aFormModel(),
          childBlocks: [],
        ),
      ],
    );
  }

  Supplier11aBlock findSupplier11aBlock() {
    return findBlock(Supplier11aBlock.blkName) as Supplier11aBlock;
  }
}
