import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/widgets/custom_app_container.dart';

class Teacher15aPageableView extends BlockSectionView<Block> {
  static const TextStyle _smallTextStyle = TextStyle(fontSize: 13);

  const Teacher15aPageableView({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    Pageable? pageable = block.pageable;
    //
    return CustomAppContainer(
      padding: EdgeInsets.all(5),
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The 'pageable' parameter is used in the latest query.",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 5),
          Text(
            "Block.pageable:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          if (pageable != null) //
            Text("- Page: ${pageable.page}", style: _smallTextStyle),
          if (pageable != null) //
            Text("- PageSize: ${pageable.pageSize}", style: _smallTextStyle),
        ],
      ),
    );
  }
}
