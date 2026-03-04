import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/model/model.dart';
import 'package:flutter_artist_demo_base/widgets/image_viewer_picker.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../block/supplier11a_block.dart';
import '../form_model/supplier11a_form_model.dart';

class Supplier11aFormView extends FormView<Supplier11aFormModel> {
  const Supplier11aFormView({super.key, required super.formModel});

  @override
  Widget buildContent(BuildContext context) {
    Supplier11aBlock block = formModel.block as Supplier11aBlock;
    SupplierData? supplierData = block.currentItemDetail;
    //
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.constrainWidth() > 460) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildImageViewerPicker(supplierData),
              SizedBox(width: 10),
              Expanded(child: _buildFormFields()),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildImageViewerPicker(supplierData),
              SizedBox(height: 15),
              _buildFormFields(),
            ],
          );
        }
      },
    );
  }

  Widget _buildImageViewerPicker(SupplierData? supplierData) {
    return ImageViewerPicker(
      keyString: "ImageViewerPicker",
      imageUrl: supplierData?.imageUrl,
      fieldName: 'xFiles',
      label: 'Pick Image:',
    );
  }

  Widget _buildFormFields() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FaFormBuilderTextField(
          name: "name",
          labelText: "Name",
          maxLines: 1,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        SizedBox(height: 12),
        FaFormBuilderTextField(
          name: "email",
          maxLines: 1,
          labelText: "Email",
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.email(),
          ]),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        SizedBox(height: 12),
        FaFormBuilderDropdown(
          name: "supplierType",
          labelText: "Supplier Type",
          items: formModel.getMultiOptPropData("supplierType") ?? [],
          getItemText: (item) => item.name,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
        ),
        SizedBox(height: 12),
        FaFormBuilderTextField(
          name: "address",
          labelText: "Address",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        SizedBox(height: 12),
        FaFormBuilderTextField(
          name: "phone",
          maxLines: 1,
          labelText: "Phone",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        SizedBox(height: 10),
        FaFormBuilderScalableSwitch(
          name: "active",
          title: Text("Active"),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        SizedBox(height: 12),
        FaFormBuilderTextField(
          name: "description",
          labelText: "Description",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ],
    );
  }
}
