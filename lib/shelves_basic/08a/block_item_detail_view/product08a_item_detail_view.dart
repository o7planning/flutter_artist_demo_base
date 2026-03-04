import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';

import '../../../model/model.dart';
import '../../../utils/number_format_utils.dart';
import '../../../widgets/image_url_view.dart';
import '../block/product08a_block.dart';

class Product08aItemDetailView extends BlockItemDetailView<Product08aBlock> {
  const Product08aItemDetailView({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    ProductData? product = block.currentItemDetail;

    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageUrlView(
            imageUrl: product?.imageUrl,
            size: 240,
            boxShape: BoxShape.rectangle,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconLabelSelectableText(
                  label: "Product: ",
                  text: product?.name ?? ' - ',
                ),
                SizedBox(height: 10),
                IconLabelSelectableText(
                  label: "Price: ",
                  text: formatCurrency(product?.price ?? 0),
                ),
                SizedBox(height: 10),
                Text(
                  product?.description ?? "",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
