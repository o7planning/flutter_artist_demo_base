import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../block/currency49a_block.dart';
import '../widget/currency49a_symbol_view.dart';

class Currency49aItemDetailView extends BlockItemDetailView<Currency49aBlock> {
  const Currency49aItemDetailView({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    // IMPORTANT:
    CurrencyData? currencyData = block.currentItemDetail;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Currency49aSymbolView(
              symbol: currencyData?.symbol,
              width: 140,
              height: 80,
              fontSize: 30,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Code: ${currencyData?.id ?? ' - '}"),
                  SizedBox(height: 10),
                  Text("Symbol: ${currencyData?.symbol ?? ' - '}"),
                  SizedBox(height: 10),
                  Text("Name: ${currencyData?.name ?? ' - '}"),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text("Description:", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(
          currencyData?.description ?? "",
          style: TextStyle(color: Colors.black38, fontSize: 13),
        ),
      ],
    );
  }
}
