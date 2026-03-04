import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/model/model.dart';

import '../block/supplier27a_block.dart';

class Supplier27aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {},
      blocks: [
        Supplier27aBlock(
          name: Supplier27aBlock.blkName,
          description: null,
          config: BlockConfig(
            onExternalShelfEvents: const ExternalShelfEventBlockRecipient(
              blockLevelReactionOn: [Event(SupplierData)],
            ),
          ),
          filterModelName: null,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  Supplier27aBlock findSupplier27aBlock() {
    return findBlock(Supplier27aBlock.blkName) as Supplier27aBlock;
  }
}
