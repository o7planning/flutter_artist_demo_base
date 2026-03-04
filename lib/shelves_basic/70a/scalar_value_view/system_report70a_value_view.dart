import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_artist_demo_base/widgets/custom_app_container.dart';

import '../../../model/model.dart';
import '../scalar/system_report70a_scalar.dart';

class SystemReport70aValueView extends ScalarValueView<SystemReport70aScalar> {
  const SystemReport70aValueView({super.key, required super.scalar});

  @override
  Widget buildContent(BuildContext context) {
    SystemReportData? systemReportData = scalar.value;

    return CustomAppContainer(
      padding: EdgeInsets.all(10),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "System Report:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Divider(),
          IconLabelText(
            label: "Supplier Count: ",
            text: systemReportData?.supplierCount.toString() ?? "",
          ),
          IconLabelText(
            label: "Category Count: ",
            text: systemReportData?.categoryCount.toString() ?? "",
          ),
          IconLabelText(
            label: "Product Count: ",
            text: systemReportData?.productCount.toString() ?? "",
          ),
          IconLabelText(
            label: "Employee Count: ",
            text: systemReportData?.employeeCount.toString() ?? "",
          ),
          IconLabelText(
            label: "Sales Order Count: ",
            text: systemReportData?.saleOrderCount.toString() ?? "",
          ),
          IconLabelText(
            label: "Note Count: ",
            text: systemReportData?.noteCount.toString() ?? "",
          ),
        ],
      ),
    );
  }
}
