import 'package:flutter_artist/flutter_artist.dart';

import '../block/employee03a_block.dart';
import '../filter_model/employee03a_filter_model.dart';

class Employee03aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {
        Employee03aFilterModel.filterName: Employee03aFilterModel(),
      },
      blocks: [
        Employee03aBlock(
          name: Employee03aBlock.blkName,
          description: null,
          config: BlockConfig(),
          filterModelName: Employee03aFilterModel.filterName,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  Employee03aFilterModel findEmployee03aFilterModel() {
    return findFilterModel(Employee03aFilterModel.filterName)
        as Employee03aFilterModel;
  }

  Employee03aBlock findEmployee03aBlock() {
    return findBlock(Employee03aBlock.blkName) as Employee03aBlock;
  }
}
