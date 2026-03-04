import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';

import '../../../model/model.dart';
import '../../../widgets/image_url_view.dart';

class Supplier71aListItem extends StatelessWidget {
  final SupplierInfo supplierInfo;
  final bool selected;
  final Function(SupplierInfo supplierInfo) onSupplierPressed;

  const Supplier71aListItem({
    super.key,
    required this.supplierInfo,
    required this.selected,
    required this.onSupplierPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Colors.indigo.withAlpha(30) : null,
      child: ListTile(
        leading: ImageUrlView(
          imageUrl: supplierInfo.imageUrl,
          boxShape: BoxShape.rectangle,
          size: 60,
        ),
        title: Text(
          supplierInfo.name,
          style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
        ),
        subtitle: IconLabelText(
          icon: Icon(
            supplierInfo.active
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank,
            size: 14,
          ),
          label: "",
          text: "Active?",
          textStyle: TextStyle(fontSize: 11),
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
    onSupplierPressed(supplierInfo);
  }
}
