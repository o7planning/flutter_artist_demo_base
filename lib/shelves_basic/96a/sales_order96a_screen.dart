import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/example/all_examples.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import '../../example/widgets/example_overview_bar.dart';
import '../../layout/my_face_screen.dart';
import 'block/sales_order96a_block.dart';
import 'block/sales_order_line96a_block.dart';
import 'block_item_detail_view/sales_order96a_item_detail_view.dart';
import 'block_items_view/sales_order96a_list_items_view.dart';
import 'block_items_view/sales_order_line96a_list_items_view.dart';
import 'dialog/sales_order_96a_dialog.dart';
import 'dialog/sales_order_line96a_dialog.dart';
import 'shelf/sales_order96a_shelf.dart';

class SalesOrder96aScreen extends MyFaceScreen {
  static const String routeName = "/sales-order96a";

  const SalesOrder96aScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    SalesOrder96aShelf shelf = FlutterArtist.storage.findShelf();
    SalesOrder96aBlock salesOrderBlock = shelf.findSalesOrder96aBlock();
    SalesOrderLine96aBlock salesOrderLineBlock = shelf
        .findSalesOrderLine96aBlock();

    return LeftRightContainer(
      startPadding: EdgeInsets.all(5),
      endPadding: EdgeInsets.all(5),
      spacing: 20,
      arrowTopPosition: 35,
      fixedSizeWidth: 220,
      minSideWidth: 320,
      autoShowTwoSidesIfPossible: true,
      start: _buildLeft(context, salesOrderBlock),
      end: _buildRight(context, salesOrderBlock, salesOrderLineBlock),
    );
  }

  Widget _buildLeft(BuildContext context, SalesOrder96aBlock salesOrderBlock) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: salesOrderBlock,
          config: BlockControlBarConfig(
            allowRefreshButton: true,
            allowQueryButton: true,
            allowCreateButton: true,
            allowSaveButton: false,
            allowDeleteButton: true,
            allowBackButton: false,
            allowDebugFormModelViewerButton: false,
            onNavigateCreate: (PrepareItemCreationResult result) {
              _onNavigateCreateSalesOrder(context, result);
            },
          ),
        ),
        Expanded(child: SalesOrder96aListItemsView(block: salesOrderBlock)),
      ],
    );
  }

  Widget _buildRight(
    BuildContext context,
    SalesOrder96aBlock salesOrderBlock,
    SalesOrderLine96aBlock salesOrderLineBlock,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExampleOverviewBar(example: example_salesOrder96a),
        SizedBox(height: 10),
        SalesOrder96aItemDetailView(block: salesOrderBlock),
        SizedBox(height: 10),
        BlockControlBar(
          description: null,
          ownerClassInstance: this,
          block: salesOrderLineBlock,
          config: BlockControlBarConfig(
            allowRefreshButton: true,
            allowQueryButton: true,
            allowCreateButton: true,
            allowSaveButton: false,
            allowDeleteButton: true,
            allowBackButton: false,
            allowDebugFormModelViewerButton: true,
            onNavigateCreate: (PrepareItemCreationResult result) {
              _onNavigateCreateSalesOrderLine(context, result);
            },
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: SalesOrderLine96aDaviTableItemsView(
            block: salesOrderLineBlock,
          ),
        ),
      ],
    );
  }

  void _onNavigateCreateSalesOrder(
    BuildContext context,
    PrepareItemCreationResult result,
  ) {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    if (result.successForFirst) {
      SalesOrder96aDialog.openDialog(context);
    }
  }

  void _onNavigateCreateSalesOrderLine(
    BuildContext context,
    PrepareItemCreationResult result,
  ) {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    if (result.successForFirst) {
      SalesOrderLine96aDialog.openDialog(context);
    }
  }

  @override
  String getTopMenuTitle() {
    return "[Form] SalesOrder96a";
  }

  @override
  String getTopMenuSubtitle() {
    return "Form & Internal Event";
  }
}
