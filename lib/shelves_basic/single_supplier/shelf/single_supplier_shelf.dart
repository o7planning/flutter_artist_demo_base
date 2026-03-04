import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../block/single_supplier_block.dart';
import '../form_model/single_supplier_form_model.dart';

class SingleSupplierShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {"single-supplier-filter-model": IntIdFilterModel()},
      blocks: [
        SingleSupplierBlock(
          name: SingleSupplierBlock.blockName,
          description: '',
          config: BlockConfig(
            emitExternalShelfEvents: [Event(SupplierData)], //
          ),
          filterModelName: "single-supplier-filter-model",
          formModel: SingleSupplierFormModel(),
          childBlocks: [],
        ),
      ],
    );
  }

  SingleSupplierBlock findSingleSupplierBlock() {
    return findBlock(SingleSupplierBlock.blockName) as SingleSupplierBlock;
  }
}
