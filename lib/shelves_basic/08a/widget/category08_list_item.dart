import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../../../widgets/image_url_view.dart';

class Category08aListItem extends StatelessWidget {
  final CategoryInfo categoryInfo;
  final bool selected;
  final Function(CategoryInfo categoryInfo) onCategoryPressed;

  const Category08aListItem({
    super.key,
    required this.categoryInfo,
    required this.selected,
    required this.onCategoryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Colors.indigo.withAlpha(30) : null,
      child: ListTile(
        leading: ImageUrlView(imageUrl: categoryInfo.imageUrl, size: 60),
        title: Text(
          categoryInfo.name,
          style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
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
    onCategoryPressed(categoryInfo);
  }
}
