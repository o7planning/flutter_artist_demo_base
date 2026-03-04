import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';

import '../../../model/model.dart';
import '../filter_model/product77a_filter_model.dart';

class Product77aFilterPanel extends FilterPanel<Product77aFilterModel> {
  const Product77aFilterPanel({required super.filterModel, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFilterBar(context),
        Divider(),
        FaFormBuilderDeselectableDropdown<CategoryInfo>.topLabel(
          name: "category~",
          labelText: "Category",
          items: filterModel.getMultiOptTildeCriterionData("category~") ?? [],
          getItemText: (item) => item.name,
          onChanged: (_) async {
            await _queryProduct77a();
          },
        ),
        SizedBox(height: 5),
        Text("Price", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        _buildPrice(),
      ],
    );
  }

  Widget _buildPrice() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.3),
        color: Colors.indigo.withAlpha(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FaFormBuilderNumberTextField.topLabel(
              name: "price~min",
              labelText: "Min",
              onChanged: (_) async {
                await _queryProduct77a();
              },
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: FaFormBuilderNumberTextField.topLabel(
              name: "price~max",
              labelText: "Max",
              onChanged: (_) async {
                await _queryProduct77a();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _queryProduct77a() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    await filterModel.queryAll();
  }
}
