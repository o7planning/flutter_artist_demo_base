import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/widgets/custom_app_container.dart';

import '../block/teacher15a_block.dart';

class Teacher15aPaginationInfoView extends BlockSectionView<Teacher15aBlock> {
  static const TextStyle _smallTextStyle = TextStyle(fontSize: 13);

  const Teacher15aPaginationInfoView({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    PaginationInfo? paginationInfo = block.paginationInfo;
    //
    return CustomAppContainer(
      padding: EdgeInsets.all(5),
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Current 'paginationInfo' of the block.",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 5),
          Text(
            "Block.paginationInfo:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          if (paginationInfo != null) //
            Text(
              "- CurrentPage: ${paginationInfo.currentPage}",
              style: _smallTextStyle,
            ),
          if (paginationInfo != null) //
            Text(
              "- PageSize: ${paginationInfo.pageSize}",
              style: _smallTextStyle,
            ),
          if (paginationInfo != null) //
            Text(
              "- TotalItems: ${paginationInfo.totalItems}",
              style: _smallTextStyle,
            ),
          if (paginationInfo != null) //
            Text(
              "- TotalPages: ${paginationInfo.totalPages}",
              style: _smallTextStyle,
            ),
        ],
      ),
    );
  }
}
