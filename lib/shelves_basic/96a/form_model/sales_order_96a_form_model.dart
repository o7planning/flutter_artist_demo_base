import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/customer_rest_provider.dart';
import '../../../rest_provider/sales_order_rest_provider.dart';

class SalesOrder96aFormModel
    extends
        FormModel<
          int, //
          SalesOrderData,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  final _salesOrderRestProvider = SalesOrderRestProvider();
  final _customerRestProvider = CustomerRestProvider();

  @override
  FormModelStructure defineFormModelStructure() {
    return FormModelStructure(
      simplePropDefs: [
        SimpleFormPropDef<int>(propName: "id"),
        SimpleFormPropDef<DateTime>(propName: "orderDateTime"),
        SimpleFormPropDef<String>(propName: "status"),
      ],
      multiOptPropDefs: [
        // Multi Option Single Selection Prop.
        MultiOptFormPropDef<CustomerInfo>.singleSelection(propName: 'customer'),
      ],
    );
  }

  @override
  Future<ApiResult<SalesOrderData>> performCreateItem({
    required Map<String, dynamic> formMapData,
  }) async {
    return await _salesOrderRestProvider.createSalesOrder(formMapData);
  }

  @override
  Future<ApiResult<SalesOrderData>> performUpdateItem({
    required Map<String, dynamic> formMapData,
  }) async {
    return await _salesOrderRestProvider.updateSalesOrder(formMapData);
  }

  @override
  Future<XData?> performLoadMultiOptPropXData({
    required String multiOptPropName,
    required SelectionType selectionType,
    required Object? parentMultiOptPropValue,
    required EmptyFormInput? formInput,
    required SalesOrderData? itemDetail,
    required EmptyFormRelatedData formRelatedData,
  }) async {
    if (multiOptPropName == "customer") {
      ApiResult<CustomerInfoPage> result = await _customerRestProvider
          .queryAll();
      // IMPORTANT:
      result.throwIfError();
      // IMPORTANT: Generics should be declared explicitly.
      return ListXData<int, CustomerInfo>.fromPageData(
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
    required SalesOrderData itemDetail,
    required EmptyFormRelatedData formRelatedData,
  }) {
    return {
      "id": itemDetail.id,
      "orderDateTime": itemDetail.orderDateTime,
      "status": itemDetail.status,
    };
  }

  @override
  OptValueWrap? extractMultiOptPropValueFromItemDetail({
    required String multiOptPropName,
    required SelectionType selectionType,
    required XData multiOptPropXData,
    required Object? parentMultiOptPropValue,
    required SalesOrderData itemDetail,
    required EmptyFormRelatedData formRelatedData,
  }) {
    if (multiOptPropName == "customer") {
      return OptValueWrap.single(itemDetail.customer);
    }
    return null;
  }

  @override
  Map<String, dynamic>? specifyDefaultValuesForSimpleProps({
    required Object? parentBlockCurrentItemId,
  }) {
    return {"orderDateTime": DateTime.now()};
  }
}
