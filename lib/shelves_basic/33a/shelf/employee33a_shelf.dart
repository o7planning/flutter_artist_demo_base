import 'package:flutter_artist/flutter_artist.dart';

import '../block/employee33a_block.dart';
import '../filter_model/employee33a_filter_model.dart';

class Employee33aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {
        Employee33aFilterModel.filterName: Employee33aFilterModel(),
      },
      blocks: [
        Employee33aBlock(
          name: Employee33aBlock.blkName,
          description: null,
          config: BlockConfig(),
          filterModelName: Employee33aFilterModel.filterName,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  Employee33aFilterModel findEmployee33aFilterModel() {
    return findFilterModel(Employee33aFilterModel.filterName)
        as Employee33aFilterModel;
  }

  Employee33aBlock findEmployee33aBlock() {
    return findBlock(Employee33aBlock.blkName) as Employee33aBlock;
  }
}
