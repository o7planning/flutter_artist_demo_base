import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/widgets/custom_app_container.dart';

import '../block/currency49a_block.dart';

class Currency49aCustomItemNavigation
    extends BlockSectionView<Currency49aBlock> {
  const Currency49aCustomItemNavigation({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    return CustomAppContainer(
      padding: EdgeInsets.all(5),
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckboxListTile(
            value: block.hasPreviousItem,
            onChanged: null,
            dense: true,
            title: Text("Has Previous Item?"),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
          CheckboxListTile(
            value: block.hasNextItem,
            onChanged: null,
            dense: true,
            title: Text("Has Next Item?"),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              TextButton(
                onPressed: block.hasPreviousItem
                    ? _navigateToPreviousItem
                    : null,
                child: Text("<< Previous Item"),
              ),
              TextButton(
                onPressed: block.hasNextItem ? _navigateToNextItem : null,
                child: Text("Next Item >>"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _navigateToPreviousItem() async {
    // IMPORTANT:
    await block.refreshPreviousItemAndSetAsCurrent();
  }

  Future<void> _navigateToNextItem() async {
    // IMPORTANT:
    await block.refreshNextItemAndSetAsCurrent();
  }
}
