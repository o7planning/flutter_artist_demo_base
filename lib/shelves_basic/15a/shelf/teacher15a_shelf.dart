import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../block/teacher15a_block.dart';
import '../filter_model/teacher15a_filter_model.dart';

class Teacher15aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {Teacher15aFilterModel.filterName: Teacher15aFilterModel()},
      blocks: [
        Teacher15aBlock(
          name: Teacher15aBlock.blkName,
          description: null,
          config: BlockConfig(pageable: Pageable(pageSize: 3)),
          filterModelName: Teacher15aFilterModel.filterName,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  Teacher15aBlock findTeacher15aBlock() {
    return findBlock(Teacher15aBlock.blkName) as Teacher15aBlock;
  }

  Teacher15aFilterModel findTeacher15aFilterModel() {
    return findFilterModel(Teacher15aFilterModel.filterName)
        as Teacher15aFilterModel;
  }
}
