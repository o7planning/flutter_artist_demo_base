import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';

import '../../../model/model.dart';
import '../../../widgets/image_url_view.dart';
import '../block/customer43a_block.dart';
import '../dialog/customer43a_code_dialog.dart';

class Customer43aItemDetailView extends BlockItemDetailView<Customer43aBlock> {
  const Customer43aItemDetailView({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    CustomerData? customerData = block.currentItemDetail;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ImageUrlView(imageUrl: customerData?.imageUrl, size: 120),
            Spacer(),
            if (customerData?.vip ?? false)
              Image.asset("static-rs/icons/vip.png"),
          ],
        ),
        SizedBox(width: 10),
        Divider(),
        IconLabelText(label: "Code:", text: customerData?.code ?? ' - '),
        SizedBox(height: 10),
        IconLabelText(label: "Name:", text: customerData?.name ?? ' - '),
        SizedBox(height: 10),
        IconLabelText(label: "Email:", text: customerData?.email ?? ' - '),
        SizedBox(height: 10),
        Text("Address:", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(customerData?.address ?? ' - '),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: block.currentItem == null
              ? null
              : () async {
                  await _changeCustomerCode(context, block.currentItem!);
                },
          child: Text("Change Customer Code"),
        ),
      ],
    );
  }

  Future<void> _changeCustomerCode(
    BuildContext context,
    CustomerInfo customer,
  ) async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: {"customer": customer},
    );
    //
    await showCustomerCodeDialog(
      context,
      customer: customer,
      customer43aBlock: block,
    );
  }
}
