import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/model/model.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../widgets/image_url_view.dart';
import '../block/sales_order96a_block.dart';
import '../form_model/sales_order_96a_form_model.dart';

class SalesOrder96aFormView extends FormView<SalesOrder96aFormModel> {
  const SalesOrder96aFormView({super.key, required super.formModel});

  @override
  Widget buildContent(BuildContext context) {
    SalesOrder96aBlock block = formModel.block as SalesOrder96aBlock;
    SalesOrderData? salesOrderData = block.currentItemDetail;
    //
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.constrainWidth() > 460) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildImageViewerPicker(salesOrderData),
              SizedBox(width: 10),
              Expanded(child: _buildFormFields()),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildImageViewerPicker(salesOrderData),
              SizedBox(height: 15),
              _buildFormFields(),
            ],
          );
        }
      },
    );
  }

  Widget _buildImageViewerPicker(SalesOrderData? salesOrderData) {
    CustomerInfo? customer = formModel.getPropValue("customer");
    return ImageUrlView(imageUrl: customer?.imageUrl, size: 180);
  }

  Widget _buildFormFields() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (formModel.formMode == FormMode.edit)
          Text("Sales Order: #${formModel.getPropValue("id")}"),
        if (formModel.formMode == FormMode.edit) SizedBox(height: 12),
        FaFormBuilderDropdown<CustomerInfo>.topLabel(
          name: "customer",
          labelText: "Customer",
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
          items: formModel.getMultiOptPropData("customer") ?? [],
          getItemText: (item) {
            return item.name;
          },
        ),
        SizedBox(height: 8),
        Text(
          "In practice, you can use Autocomplete instead of Dropdown (See example Form 86a).",
          style: TextStyle(fontSize: 11, color: Colors.black38),
        ),
        SizedBox(height: 12),
        FaFormBuilderDateTimePicker.topLabel(
          name: "orderDateTime",
          labelText: "Order Date Time",
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
        ),
      ],
    );
  }
}
