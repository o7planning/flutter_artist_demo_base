import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/model/model.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../utils/number_format_utils.dart';
import '../../../widgets/image_url_view.dart';
import '../block/sales_order_line96a_block.dart';
import '../form_model/sales_order_line96a_form_model.dart';

class SalesOrderLine96aFormView extends FormView<SalesOrderLine96aFormModel> {
  const SalesOrderLine96aFormView({super.key, required super.formModel});

  @override
  Widget buildContent(BuildContext context) {
    SalesOrderLine96aBlock block = formModel.block as SalesOrderLine96aBlock;
    SalesOrderLineData? salesOrderLineData = block.currentItemDetail;
    //
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.constrainWidth() > 460) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildImageViewerPicker(salesOrderLineData),
              SizedBox(width: 10),
              Expanded(child: _buildFormFields()),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildImageViewerPicker(salesOrderLineData),
              SizedBox(height: 15),
              _buildFormFields(),
            ],
          );
        }
      },
    );
  }

  Widget _buildImageViewerPicker(SalesOrderLineData? salesOrderLineData) {
    ProductInfo? productInfo = formModel.getPropValue("product");
    return ImageUrlView(imageUrl: productInfo?.imageUrl, size: 180);
  }

  Widget _buildFormFields() {
    ProductInfo? productInfo = formModel.getPropValue("product");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FaFormBuilderDropdown<ProductInfo>.topLabel(
          name: "product",
          labelText: "Product",
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
          items: formModel.getMultiOptPropData("product") ?? [],
          getItemText: (item) {
            return item.name;
          },
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Price: ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(formatCurrency(productInfo?.price ?? 0)),
          ],
        ),
        SizedBox(height: 12),
        FaFormBuilderNumberTextField.topLabel(
          name: "units",
          labelText: "Units",
          groupDigits: 3,
          decimalDigits: 0,
          integerDigits: 14,
          allowNegative: false,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
        ),
      ],
    );
  }
}
