import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../block/country12a_block.dart';
import '../sort_model_builder/country12a_sort_model_builder.dart';

class Country12aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {},
      blocks: [
        Country12aBlock(
          name: Country12aBlock.blkName,
          description: null,
          config: BlockConfig(
            pageable: Pageable(pageSize: 5),
            clientSideSortStrategy: SortStrategy.modelBased,
          ),
          filterModelName: null,
          formModel: null,
          childBlocks: [],
          sortModelBuilder: Country12aSortModelBuilder(
            clientSideSortMode: SortMode.single,
            serverSideSortMode: SortMode.single,
          ),
        ),
      ],
    );
  }

  Country12aBlock findCountry12aBlock() {
    return findBlock(Country12aBlock.blkName) as Country12aBlock;
  }
}
