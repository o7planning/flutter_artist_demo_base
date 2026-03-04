import 'package:flutter_artist/flutter_artist.dart';

import '../block/employee40a_block.dart';
import '../filter_model/employee40a_filter_model.dart';

class Employee40aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {
        Employee40aFilterModel.filterName: Employee40aFilterModel(),
      },
      blocks: [
        Employee40aBlock(
          name: Employee40aBlock.blkName,
          description: null,
          config: BlockConfig(),
          filterModelName: Employee40aFilterModel.filterName,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  Employee40aFilterModel findEmployee40aFilterModel() {
    return findFilterModel(Employee40aFilterModel.filterName)
        as Employee40aFilterModel;
  }

  Employee40aBlock findEmployee40aBlock() {
    return findBlock(Employee40aBlock.blkName) as Employee40aBlock;
  }
}
