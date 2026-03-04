import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';

import '../../widgets/highlight_view.dart';
import 'block/single_supplier_block.dart';
import 'form_model/single_supplier_form_model.dart';
import 'form_view/single_supplier_form_view.dart';
import 'shelf/single_supplier_shelf.dart';

class SingleSupplierFormDialog extends StatelessWidget {
  const SingleSupplierFormDialog({super.key});

  @override
  Widget build(BuildContext context) {
    SingleSupplierShelf shelf = FlutterArtist.storage.findShelf();
    SingleSupplierBlock block = shelf.findSingleSupplierBlock();
    SingleSupplierFormModel formModel =
        block.formModel as SingleSupplierFormModel;

    Size preferSize = calculateDialogSize(
      context,
      preferredWidth: 640,
      preferredHeight: 400,
    );
    Widget dialog = FaAlertDialog(
      titleText: "Create/Edit Supplier",
      contentPadding: EdgeInsets.all(5),
      content: SizedBox(
        width: preferSize.width,
        height: preferSize.height,
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
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(5),
                child: SingleSupplierFormView(formModel: formModel),
              ),
            ),
          ],
        ),
      ),
    );
    return dialog;
  }

  void _onNavigateSave(BuildContext context, FormSaveResult result) {
    if (result.successForFirst) {
      Navigator.pop(context);
    }
  }

  // Static Method:
  static Future<void> openDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleSupplierFormDialog();
      },
    );
  }
}
