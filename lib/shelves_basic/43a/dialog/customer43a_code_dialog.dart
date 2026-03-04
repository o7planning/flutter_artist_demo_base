import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_artist_demo_base/utils/upper_case_text_formatter.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';

import '../../../model/model.dart';
import '../action/custome43a_code_update_action.dart';
import '../block/customer43a_block.dart';

class Customer43aCodeDialog extends StatefulWidget {
  final Customer43aBlock customer43aBlock;
  final CustomerInfo customer;

  const Customer43aCodeDialog({
    required this.customer43aBlock,
    required this.customer,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _Customer43aCodeDialogState();
  }
}

class _Customer43aCodeDialogState extends State<Customer43aCodeDialog> {
  late String customerCode;

  @override
  void initState() {
    super.initState();
    customerCode = widget.customer.code;
  }

  @override
  Widget build(BuildContext context) {
    Size size = calculatePreferredDialogSize(
      context,
      preferredWidth: 360,
      preferredHeight: 200,
    );
    //
    // Set up the AlertDialog
    FaAlertDialog alert = FaAlertDialog(
      titleText: "Change Customer Code",
      contentPadding: const EdgeInsets.all(5),
      content: _buildMainContent(context, size.width, size.height),
      clipBehavior: Clip.hardEdge,
    );
    return alert;
  }

  Widget _buildMainContent(BuildContext context, double width, double height) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconLabelText(
            label: "Customer: ",
            text: widget.customer.name,
            style: TextStyle(overflow: TextOverflow.ellipsis),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: FaFormBuilderTextField.topLabel(
                  name: "customerCode",
                  labelText: "Customer Code",
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[-_0-9a-zA-Z]")),
                    UpperCaseTextFormatter(),
                  ],
                  initialValue: customerCode,
                  onChanged: (String? text) {
                    customerCode = text ?? "";
                    setState(() {});
                  },
                ),
              ),
              TextButton(
                onPressed:
                    (customerCode.isNotEmpty &&
                        customerCode != widget.customer.code)
                    ? () {
                        _onPressedBtnUpdateCustomerCode();
                      }
                    : null,
                child: Text("Change"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _onPressedBtnUpdateCustomerCode() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    var updateAction = Customer43aCodeUpdateAction(
      item: widget.customer,
      config: BlockQuickItemUpdateActionConfig(errorIfItemNotInTheBlock: true),
      code: customerCode,
      needToConfirm: false,
      actionInfo: "Update code for Customer:\n${widget.customer.name}",
    );
    //
    BlockQuickItemUpdateResult result = await widget.customer43aBlock
        .executeQuickItemUpdateAction(action: updateAction);
    if (result.successForAll && context.mounted) {
      Navigator.of(context).pop();
    }
  }
}

Future<void> showCustomerCodeDialog(
  BuildContext context, {
  required Customer43aBlock customer43aBlock,
  required CustomerInfo customer,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Customer43aCodeDialog(
        customer43aBlock: customer43aBlock,
        customer: customer,
      );
    },
  );
}
