import 'package:flutter_artist/flutter_artist.dart';

import '../block/supplier26a_block.dart';
import '../form_model/supplier26a_form_model.dart';

class Supplier26aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {},
      blocks: [
        Supplier26aBlock(
          name: Supplier26aBlock.blkName,
          description: null,
          config: BlockConfig(),
          filterModelName: null,
          formModel: Supplier26aFormModel(),
          childBlocks: [],
        ),
      ],
    );
  }

  Supplier26aBlock findSupplier26aBlock() {
    return findBlock(Supplier26aBlock.blkName) as Supplier26aBlock;
  }
}
