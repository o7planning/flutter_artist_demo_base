import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../block/country48a_block.dart';

class Country48aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {},
      blocks: [
        Country48aBlock(
          name: Country48aBlock.blkName,
          description: null,
          config: BlockConfig(pageable: Pageable(pageSize: 20)),
          filterModelName: null,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  Country48aBlock findCountry48aBlock() {
    return findBlock(Country48aBlock.blkName) as Country48aBlock;
  }
}
