import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../../single_supplier/coordinator/single_supplier_creation_coordinator.dart';
import '../../single_supplier/coordinator/single_supplier_edit_coordinator.dart';
import '../block/supplier71a_block.dart';

class Supplier71aButtons extends BlockSectionView<Supplier71aBlock> {
  const Supplier71aButtons({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: [
            ElevatedButton(
              onPressed: () {
                _onPressEditSupplierBtn(context);
              },
              child: Text("Edit Supplier"),
            ),
            ElevatedButton(
              onPressed: () {
                _onPressCreateSupplierBtn(context);
              },
              child: Text("Create Supplier"),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          "Call to SingleSupplierShelf/SingleSupplierBlock to create/edit supplier",
          style: TextStyle(color: Colors.red, fontSize: 12),
        ),
      ],
    );
  }

  Future<void> _onPressEditSupplierBtn(BuildContext context) async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    SupplierInfo? supplierInfo = block.currentItem;
    if (supplierInfo == null) {
      return;
    }
    Coordinator coordinator = SingleSupplierEditCoordinator(
      supplierId: supplierInfo.id,
      config: CoordinatorConfig(),
      customNavigate: (BuildContext context, bool success) {
        if (success) {
          FlutterArtist.storage
              .openEndDrawerAndDeferExternalShelfEventsUntilClosed(context);
        }
      },
    );
    await coordinator.execute(context);
  }

  Future<void> _onPressCreateSupplierBtn(BuildContext context) async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    Coordinator coordinator = SingleSupplierCreationCoordinator(
      config: CoordinatorConfig(),
      customNavigate: (BuildContext context, bool success) {
        if (success) {
          FlutterArtist.storage
              .openEndDrawerAndDeferExternalShelfEventsUntilClosed(context);
        }
      },
    );
    await coordinator.execute(context);
  }
}
