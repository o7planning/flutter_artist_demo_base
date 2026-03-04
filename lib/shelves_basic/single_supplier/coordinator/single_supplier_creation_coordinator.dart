import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:get/get.dart';

import '../block/single_supplier_block.dart';
import '../shelf/single_supplier_shelf.dart';
import '../single_supplier_form_screen.dart';

class SingleSupplierCreationCoordinator extends Coordinator {
  SingleSupplierCreationCoordinator({
    required super.config,
    required super.customNavigate,
  });

  @override
  Future<bool> performSetupOperation() async {
    SingleSupplierShelf shelf = FlutterArtist.storage.findShelf();
    SingleSupplierBlock block = shelf.findSingleSupplierBlock();

    // Never been queried
    if (block.dataState == DataState.pending) {
      await block.queryEmpty();
    }
    PrepareItemCreationResult result = await block.prepareFormToCreateItem(
      navigate: null,
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
