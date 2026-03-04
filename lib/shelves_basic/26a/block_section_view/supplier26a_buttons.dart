import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';

import '../block/supplier26a_block.dart';
import '../form_input/supplier26a_form_input.dart';
import '../form_model/supplier26a_form_model.dart';

class Supplier26aButtons extends StatelessWidget {
  Supplier26aBlock block;

  Supplier26aButtons({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    Supplier26aFormInput formInput = Supplier26aFormInput.defaultForTest();
    //
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconLabelText(label: "Email: ", text: formInput.email),
        IconLabelText(
          label: "Supplier Type Code: ",
          text: formInput.supplierTypeCode ?? "",
        ),
        IconLabelText(label: "Address: ", text: formInput.address),
        IconLabelText(label: "Phone: ", text: formInput.phone),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _patchFormFields26a,
          child: Text(
            "Patch the Form with above values programmatically.",
            style: TextStyle(fontSize: 13),
          ),
        ),
      ],
    );
  }

  Future<void> _patchFormFields26a() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    Supplier26aFormModel formModel = block.formModel as Supplier26aFormModel;
    Supplier26aFormInput formInput = Supplier26aFormInput.defaultForTest();
    await formModel.patchFormFields(formInput: formInput);
  }
}
