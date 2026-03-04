import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/product_rest_provider.dart';
import '../../../rest_provider/sales_order_line_rest_provider.dart';

class SalesOrderLine96aFormModel
    extends
        FormModel<
          int, //
          SalesOrderLineData,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  final _salesOrderLineRestProvider = SalesOrderLineRestProvider();
  final _productRestProvider = ProductRestProvider();

  @override
  FormModelStructure defineFormModelStructure() {
    return FormModelStructure(
      simplePropDefs: [
        SimpleFormPropDef<int>(propName: "id"),
        SimpleFormPropDef<int>(propName: "salesOrderId"),
        SimpleFormPropDef<double>(propName: "units"),
      ],
      multiOptPropDefs: [
        // Multi Option Single Selection Prop.
        MultiOptFormPropDef<ProductInfo>.singleSelection(propName: 'product'),
      ],
    );
  }

  @override
  Future<ApiResult<SalesOrderLineData>> performCreateItem({
    required Map<String, dynamic> formMapData,
  }) async {
    return await _salesOrderLineRestProvider.createSalesOrderLine(formMapData);
  }

  @override
  Future<ApiResult<SalesOrderLineData>> performUpdateItem({
    required Map<String, dynamic> formMapData,
  }) async {
    return await _salesOrderLineRestProvider.updateSalesOrderLine(formMapData);
  }

  @override
  Future<XData?> performLoadMultiOptPropXData({
    required String multiOptPropName,
    required SelectionType selectionType,
    required Object? parentMultiOptPropValue,
    required EmptyFormInput? formInput,
    required SalesOrderLineData? itemDetail,
    required EmptyFormRelatedData formRelatedData,
  }) async {
    if (multiOptPropName == "product") {
      ApiResult<ProductInfoPage> result = await _productRestProvider.queryAll();
      // IMPORTANT:
      result.throwIfError();
      // IMPORTANT: Generics should be declared explicitly.
      return ListXData<int, ProductInfo>.fromPageData(
        pageData: result.data,
        getItemId: (item) => item.id,
      );
    }
    return null;
  }

  @override
  OptValueWrap? extractUpdateValueForMultiOptProp({
    required String multiOptPropName,
    required SelectionType selectionType,
    required XData multiOptPropXData,
    required Object? parentMultiOptPropValue,
    required Object? parentBlockCurrentItemId,
    required EmptyFormInput formInput,
    required EmptyFormRelatedData formRelatedData,
  }) {
    return null;
  }

  @override
  OptValueWrap? specifyDefaultValueForMultiOptProp({
    required String multiOptPropName,
    required SelectionType selectionType,
    required XData multiOptPropXData,
    required Object? parentMultiOptPropValue,
  }) {
    return null;
  }

  @override
  Map<String, SimpleValueWrap?>? extractUpdateValuesForSimpleProps({
    required Object? parentBlockCurrentItemId,
    required EmptyFormInput formInput,
    required EmptyFormRelatedData formRelatedData,
  }) {
    return null;
  }

  @override
  Map<String, dynamic>? extractSimplePropValuesFromItemDetail({
    required Object? parentBlockCurrentItemId,
    required SalesOrderLineData itemDetail,
    required EmptyFormRelatedData formRelatedData,
  }) {
    return {
      "id": itemDetail.id,
      "units": itemDetail.units,
      "salesOrderId": parentBlockCurrentItemId,
    };
  }

  @override
  OptValueWrap? extractMultiOptPropValueFromItemDetail({
    required String multiOptPropName,
    required SelectionType selectionType,
    required XData multiOptPropXData,
    required Object? parentMultiOptPropValue,
    required SalesOrderLineData itemDetail,
    required EmptyFormRelatedData formRelatedData,
  }) {
    if (multiOptPropName == "product") {
      return OptValueWrap.single(itemDetail.product);
    }
    return null;
  }

  @override
  Map<String, dynamic>? specifyDefaultValuesForSimpleProps({
    required Object? parentBlockCurrentItemId,
  }) {
    return {"units": 1, "salesOrderId": parentBlockCurrentItemId};
  }
}
