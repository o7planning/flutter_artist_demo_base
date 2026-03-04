import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../form_model/supplier26a_form_model.dart';

class Supplier26aFormView extends FormView<Supplier26aFormModel> {
  const Supplier26aFormView({super.key, required super.formModel});

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FaFormBuilderTextField(
          name: "name",
          labelText: "Name",
          hintText: "",
          maxLines: 1,
          enabled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
        ),
        const SizedBox(height: 12),
        FaFormBuilderTextField(
          name: "email",
          maxLines: 1,
          labelText: "Email",
          enabled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.email(),
          ]),
        ),
        const SizedBox(height: 12),
        FaFormBuilderDropdown(
          name: "supplierType",
          labelText: "Supplier Type",
          enabled: true,
          items: formModel.getMultiOptPropData("supplierType") ?? [],
          getItemText: (item) => item.name,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
        ),
        const SizedBox(height: 12),
        const FaFormBuilderTextField(
          key: Key("textField-address"),
          name: "address",
          labelText: "Address",
          enabled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        const SizedBox(height: 12),
        const FaFormBuilderTextField(
          name: "phone",
          maxLines: 1,
          labelText: "Phone",
          enabled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        const SizedBox(height: 10),
        //
        const FaFormBuilderScalableSwitch(
          name: "active",
          title: Text("Active"),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        const SizedBox(height: 12),
        const FaFormBuilderTextField(
          name: "description",
          labelText: "Description",
          enabled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ],
    );
  }
}
