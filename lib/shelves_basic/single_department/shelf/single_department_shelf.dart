import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../block/single_department_block.dart';
import '../filter_model/single_department_filter_model.dart';
import '../form_model/single_department_form_model.dart';

class SingleDepartmentShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {
        SingleDepartmentFilterModel.flrName: SingleDepartmentFilterModel(),
      },
      blocks: [
        SingleDepartmentBlock(
          name: SingleDepartmentBlock.blkName,
          description: null,
          config: BlockConfig(emitExternalShelfEvents: [Event(DepartmentData)]),
          filterModelName: SingleDepartmentFilterModel.flrName,
          formModel: SingleDepartmentFormModel(),
          childBlocks: [],
        ),
      ],
    );
  }

  SingleDepartmentBlock findSingleDepartmentBlock() {
    return findBlock(SingleDepartmentBlock.blkName) as SingleDepartmentBlock;
  }

  SingleDepartmentFilterModel findSingleDepartmentFilterModel() {
    return findFilterModel(SingleDepartmentFilterModel.flrName)
        as SingleDepartmentFilterModel;
  }
}
