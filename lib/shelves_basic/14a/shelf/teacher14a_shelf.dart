import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../block/teacher14a_block.dart';
import '../filter_model/teacher14a_filter_model.dart';

class Teacher14aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {Teacher14aFilterModel.filterName: Teacher14aFilterModel()},
      blocks: [
        Teacher14aBlock(
          name: Teacher14aBlock.blkName,
          description: null,
          config: BlockConfig(pageable: Pageable(pageSize: 10)),
          filterModelName: Teacher14aFilterModel.filterName,
          formModel: null,
          childBlocks: [],
        ),
      ],
    );
  }

  Teacher14aBlock findTeacher14aBlock() {
    return findBlock(Teacher14aBlock.blkName) as Teacher14aBlock;
  }

  Teacher14aFilterModel findTeacher14aFilterModel() {
    return findFilterModel(Teacher14aFilterModel.filterName)
        as Teacher14aFilterModel;
  }
}
