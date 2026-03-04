import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';

import '../block/sales_order96a_block.dart';
import '../form_model/sales_order_96a_form_model.dart';
import '../form_view/sales_order96a_form_view.dart';
import '../shelf/sales_order96a_shelf.dart';

class SalesOrder96aDialog extends StatelessWidget {
  const SalesOrder96aDialog({super.key});

  @override
  Widget build(BuildContext context) {
    SalesOrder96aShelf shelf = FlutterArtist.storage.findShelf();
    SalesOrder96aBlock salesOrder96aBlock = shelf.findSalesOrder96aBlock();

    Size preferSize = calculateDialogSize(
      context,
      preferredWidth: 640,
      preferredHeight: 320,
    );
    Widget dialog = FaAlertDialog(
      titleText: "Sales Order",
      content: SizedBox(
        width: preferSize.width,
        height: preferSize.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlockControlBar(
              ownerClassInstance: this,
              description: "",
              block: salesOrder96aBlock,
              config: BlockControlBarConfig(
                allowRefreshButton: true,
                allowQueryButton: false,
                allowCreateButton: true,
                allowSaveButton: true,
                allowDeleteButton: true,
                allowBackButton: false,
                allowDebugFormModelViewerButton: true,
                onNavigateSave: (FormSaveResult result) {
                  _onNavigateSave(context, result);
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SalesOrder96aFormView(
                formModel:
                    salesOrder96aBlock.formModel as SalesOrder96aFormModel,
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
        return SalesOrder96aDialog();
      },
    );
  }
}
