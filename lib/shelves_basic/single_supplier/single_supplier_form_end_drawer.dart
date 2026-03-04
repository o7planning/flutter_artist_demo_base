import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../widgets/highlight_view.dart';
import 'block/single_supplier_block.dart';
import 'form_model/single_supplier_form_model.dart';
import 'form_view/single_supplier_form_view.dart';
import 'shelf/single_supplier_shelf.dart';

class SingleSupplierFormEndDrawer extends StatelessWidget {
  const SingleSupplierFormEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    SingleSupplierShelf shelf = FlutterArtist.storage.findShelf();
    SingleSupplierBlock block = shelf.findSingleSupplierBlock();
    SingleSupplierFormModel formModel =
        block.formModel as SingleSupplierFormModel;

    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HighlightView(
            backgroundColor: Colors.indigo,
            text: "${getClassName(shelf)} (SingleSupplierFormView)",
          ),
          SizedBox(height: 10),
          BlockControlBar(
            ownerClassInstance: this,
            description: null,
            block: block,
            config: BlockControlBarConfig(
              allowRefreshButton: true,
              allowQueryButton: false,
              allowCreateButton: false,
              allowSaveButton: true,
              allowDeleteButton: true,
              allowBackButton: false,
              allowDebugFormModelViewerButton: true,
              allowDebugFilterCriteriaViewerButton: true,
              allowDebugButton: true,
            ),
          ),
          SizedBox(height: 10),
          SingleSupplierFormView(formModel: formModel),
        ],
      ),
    );
  }
}
