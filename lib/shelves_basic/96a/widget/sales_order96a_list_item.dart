import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';

class SalesOrder96aListItem extends StatelessWidget {
  final SalesOrderInfo salesOrderInfo;
  final bool selected;
  final Function(SalesOrderInfo salesOrderInfo) onSalesOrderPressed;

  const SalesOrder96aListItem({
    super.key,
    required this.salesOrderInfo,
    required this.selected,
    required this.onSalesOrderPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Colors.indigo.withAlpha(30) : null,
      child: ListTile(
        title: Text(
          "SalesOrder: #${salesOrderInfo.id}",
          style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
        ),
        subtitle: Text(
          "Statue: ${salesOrderInfo.status}",
          style: TextStyle(fontSize: 12),
        ),
        onTap: _onTap,
      ),
    );
  }

  void _onTap() {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    onSalesOrderPressed(salesOrderInfo);
  }
}
