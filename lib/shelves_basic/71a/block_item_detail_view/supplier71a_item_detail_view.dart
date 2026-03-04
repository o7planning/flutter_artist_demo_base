import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_artist_demo_base/widgets/custom_app_container.dart';

import '../../../model/model.dart';
import '../block/supplier71a_block.dart';

class Supplier71aItemDetailView extends BlockItemDetailView<Supplier71aBlock> {
  const Supplier71aItemDetailView({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    SupplierData? supplierData = block.currentItemDetail;

    if (supplierData == null) {
      return CustomAppContainer(
        width: double.maxFinite,
        height: 200,
        child: Text("No Supplier Selected"),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconLabelText(label: "Name: ", text: supplierData.name),
        SizedBox(height: 10),
        IconLabelText(label: "Email: ", text: supplierData.email),
        Divider(height: 20),
      ],
    );
  }
}
