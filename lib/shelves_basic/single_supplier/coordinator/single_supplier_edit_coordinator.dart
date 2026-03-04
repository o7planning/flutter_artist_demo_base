import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:get/get.dart';

import '../block/single_supplier_block.dart';
import '../shelf/single_supplier_shelf.dart';
import '../single_supplier_form_screen.dart';

class SingleSupplierEditCoordinator extends Coordinator {
  final int supplierId;

  SingleSupplierEditCoordinator({
    required this.supplierId,
    required super.config,
    required super.customNavigate,
  });

  @override
  Future<bool> performSetupOperation() async {
    SingleSupplierShelf shelf = FlutterArtist.storage.findShelf();
    SingleSupplierBlock block = shelf.findSingleSupplierBlock();

    IntIdFilterInput filterInput = IntIdFilterInput(idValue: supplierId);
    // With SingleItemBlock,
    // this query return a List with only one item (SupplierData).
    BlockQueryResult result = await block.query(
      filterInput: filterInput,
      afterQueryAction: AfterQueryAction.setAnItemAsCurrentThenLoadForm,
    );
    if (!result.successForAll) {
      return false;
    }
    return true;
  }

  @override
  Future<void> defaultNavigate(BuildContext context, bool success) async {
    if (success) {
      await Get.to(() => SingleSupplierFormScreen());
    }
  }
}
