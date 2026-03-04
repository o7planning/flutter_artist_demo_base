import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../block/customer43a_block.dart';

class Customer43aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {},
      blocks: [
        Customer43aBlock(
          name: Customer43aBlock.blkName,
          description: null,
          config: BlockConfig(pageable: Pageable(pageSize: 10)),
          filterModelName: null,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  Customer43aBlock findCustomer43aBlock() {
    return findBlock(Customer43aBlock.blkName) as Customer43aBlock;
  }
}
