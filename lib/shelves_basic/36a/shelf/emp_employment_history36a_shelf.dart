import 'package:flutter_artist/flutter_artist.dart';

import '../block/employee36a_block.dart';
import '../block/employment_history36a_block.dart';
import '../form_model/employment_history36a_form_model.dart';

class EmpEmploymentHistory36aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {},
      blocks: [
        Employee36aBlock(
          name: Employee36aBlock.blkName,
          description: null,
          config: BlockConfig(),
          filterModelName: null,
          formModel: null,
          childBlocks: [
            EmploymentHistory36aBlock(
              name: EmploymentHistory36aBlock.blkName,
              description: null,
              config: BlockConfig(),
              filterModelName: null,
              formModel: EmploymentHistory36aFormModel(),
              childBlocks: null,
            ),
          ],
        ),
      ],
    );
  }

  Employee36aBlock findEmployee36aBlock() {
    return findBlock(Employee36aBlock.blkName) as Employee36aBlock;
  }

  EmploymentHistory36aBlock findEmploymentHistory36aBlock() {
    return findBlock(EmploymentHistory36aBlock.blkName)
        as EmploymentHistory36aBlock;
  }
}
