import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../../../widgets/custom_app_container.dart';
import '../../../widgets/image_url_view.dart';
import '../block/category08a_block.dart';

class Category08aItemDetailView extends BlockItemDetailView<Category08aBlock> {
  const Category08aItemDetailView({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    CategoryData? catData = block.currentItemDetail;

    return CustomAppContainer(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageUrlView(
            imageUrl: catData?.imageUrl,
            size: 80,
            boxShape: BoxShape.rectangle,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Category: ${catData?.name ?? ' - '}"),
                SizedBox(height: 10),
                Text(
                  catData?.description ?? "[No description]",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
