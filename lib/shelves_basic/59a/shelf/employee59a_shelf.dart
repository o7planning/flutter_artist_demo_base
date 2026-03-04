import 'package:flutter_artist/flutter_artist.dart';

import '../block/employee59a_block.dart';
import '../filter_model/employee59a_filter_model.dart';

class Employee59aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {
        Employee59aFilterModel.filterName: Employee59aFilterModel(),
      },
      blocks: [
        Employee59aBlock(
          name: Employee59aBlock.blkName,
          description: null,
          config: BlockConfig(),
          filterModelName: Employee59aFilterModel.filterName,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  Employee59aFilterModel findEmployee59aFilterModel() {
    return findFilterModel(Employee59aFilterModel.filterName)
        as Employee59aFilterModel;
  }

  Employee59aBlock findEmployee59aBlock() {
    return findBlock(Employee59aBlock.blkName) as Employee59aBlock;
  }
}
