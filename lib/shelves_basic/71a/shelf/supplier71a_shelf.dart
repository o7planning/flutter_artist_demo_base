import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/model/model.dart';

import '../block/supplier71a_block.dart';

class Supplier71aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {},
      blocks: [
        Supplier71aBlock(
          name: Supplier71aBlock.blkName,
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

  Supplier71aBlock findSupplier71aBlock() {
    return findBlock(Supplier71aBlock.blkName) as Supplier71aBlock;
  }
}
