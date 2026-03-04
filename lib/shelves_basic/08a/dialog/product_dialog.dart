import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';

import '../block/product08a_block.dart';
import '../block_item_detail_view/product08a_item_detail_view.dart';
import '../shelf/cat_product08a_shelf.dart';

class Product08aDialog extends StatelessWidget {
  const Product08aDialog({super.key});

  @override
  Widget build(BuildContext context) {
    CatProduct08aShelf shelf = FlutterArtist.storage.findShelf();
    Product08aBlock product08aBlock = shelf.findProduct08aBlock();

    Widget dialog = FaAlertDialog(
      titleText: "Product",
      content: SizedBox(
        width: 480,
        height: 280,
        child: Product08aItemDetailView(block: product08aBlock),
      ),
    );
    return dialog;
  }

  // Static Method:
  static Future<void> showProduct08aDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Product08aDialog();
      },
    );
  }
}
