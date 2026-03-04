import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';

import '../block/sales_order_line96a_block.dart';
import '../form_model/sales_order_line96a_form_model.dart';
import '../form_view/sales_order_line96a_form_view.dart';
import '../shelf/sales_order96a_shelf.dart';

class SalesOrderLine96aDialog extends StatelessWidget {
  const SalesOrderLine96aDialog({super.key});

  @override
  Widget build(BuildContext context) {
    SalesOrder96aShelf shelf = FlutterArtist.storage.findShelf();
    SalesOrderLine96aBlock salesOrderLine96aBlock = shelf
        .findSalesOrderLine96aBlock();

    Size preferSize = calculateDialogSize(
      context,
      preferredWidth: 640,
      preferredHeight: 320,
    );
    Widget dialog = FaAlertDialog(
      titleText: "Sales Order Line",
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
              block: salesOrderLine96aBlock,
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
              child: SalesOrderLine96aFormView(
                formModel:
                    salesOrderLine96aBlock.formModel
                        as SalesOrderLine96aFormModel,
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
        return SalesOrderLine96aDialog();
      },
    );
  }
}
