import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../block/sales_order96a_block.dart';
import '../block/sales_order_line96a_block.dart';
import '../form_model/sales_order_96a_form_model.dart';
import '../form_model/sales_order_line96a_form_model.dart';

class SalesOrder96aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      description: null,
      filterModels: {},
      blocks: [
        SalesOrder96aBlock(
          name: SalesOrder96aBlock.blkName,
          description: null,
          config: BlockConfig(
            pageable: Pageable(pageSize: 3),
            onInternalShelfEvents: InternalShelfEventBlockRecipient(
              itemLevelReactionOn: [
                Evt.ofBlock(SalesOrderLine96aBlock.blkName),
              ],
            ),
          ),
          filterModelName: null,
          formModel: SalesOrder96aFormModel(),
          childBlocks: [
            SalesOrderLine96aBlock(
              name: SalesOrderLine96aBlock.blkName,
              description: null,
              config: BlockConfig(),
              filterModelName: null,
              formModel: SalesOrderLine96aFormModel(),
              childBlocks: [],
            ),
          ],
        ),
      ],
    );
  }

  SalesOrder96aBlock findSalesOrder96aBlock() {
    return findBlock(SalesOrder96aBlock.blkName) as SalesOrder96aBlock;
  }

  SalesOrderLine96aBlock findSalesOrderLine96aBlock() {
    return findBlock(SalesOrderLine96aBlock.blkName) as SalesOrderLine96aBlock;
  }
}
