import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import 'currency49a_symbol_view.dart';

class Currency49aListItem extends StatelessWidget {
  final CurrencyInfo currencyInfo;
  final bool selected;
  final Function(CurrencyInfo currencyInfo) onCurrencyPressed;

  const Currency49aListItem({
    super.key,
    required this.currencyInfo,
    required this.selected,
    required this.onCurrencyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Colors.indigo.withAlpha(30) : null,
      child: ListTile(
        leading: Currency49aSymbolView(
          symbol: currencyInfo.symbol,
          width: 60,
          height: 30,
          fontSize: 22,
        ),
        title: Text(
          currencyInfo.id,
          style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
        ),
        subtitle: Text(
          currencyInfo.name,
          style: const TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
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
    onCurrencyPressed(currencyInfo);
  }
}
