import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/rest_provider/supplier_rest_provider.dart';

import '../../../model/model.dart';
import '../../../rest_provider/supplier_type_rest_provider.dart';

class SingleSupplierFormModel
    extends
        FormModel<
          int, //
          SupplierData,
          EmptyFormInput,
          EmptyAdditionalFormRelatedData
        > {
  final supplierRestProvider = SupplierRestProvider();
  final supplierTypeRestProvider = SupplierTypeRestProvider();

  @override
  FormModelStructure defineFormModelStructure() {
    return FormModelStructure(
      simplePropDefs: [
        SimpleFormPropDef<int>(propName: "id"),
        SimpleFormPropDef<String>(propName: "name"),
        SimpleFormPropDef<String>(propName: "email"),
        SimpleFormPropDef<String>(propName: "address"),
        SimpleFormPropDef<String>(propName: "phone"),
        SimpleFormPropDef<bool>(propName: "active"),
        SimpleFormPropDef<String>(propName: "description"),
        SimpleFormPropDef<dynamic>(propName: "xFiles"), // or List<XFile>
      ],
      multiOptPropDefs: [
        MultiOptFormPropDef<SupplierTypeInfo>.singleSelection(
          propName: 'supplierType',
        ),
      ],
    );
  }

  @override
  Future<ApiResult<SupplierData>> performCreateItem({
    required Map<String, dynamic> formMapData,
  }) async {
    return await supplierRestProvider.createSupplier(formMapData);
  }

  @override
  Future<ApiResult<SupplierData>> performUpdateItem({
    required Map<String, dynamic> formMapData,
  }) async {
    return await supplierRestProvider.updateSupplier(formMapData);
  }

  @override
  Future<XData?> performLoadMultiOptPropXData({
    required String multiOptPropName,
    required SelectionType selectionType,
    required Object? parentMultiOptPropValue,
    required EmptyFormInput? formInput,
    required SupplierData? itemDetail,
    required EmptyAdditionalFormRelatedData additionalFormRelatedData,
  }) async {
    if (multiOptPropName == "supplierType") {
      ApiResult<SupplierTypeInfoPage> result = await supplierTypeRestProvider
          .queryAll();
      // IMPORTANT:
      result.throwIfError();
      // IMPORTANT: Generics should be declared explicitly.
      return ListXData<int, SupplierTypeInfo>.fromPageData(
        pageData: result.data,
        getItemId: (item) => item.id,
      );
    }
    return null;
  }

  @override
  OptValueWrap<Object>? extractUpdateValueForMultiOptProp({
    required String multiOptPropName,
    required SelectionType selectionType,
    required XData multiOptPropXData,
    required Object? parentMultiOptPropValue,
    required Object? parentBlockCurrentItemId,
    required EmptyFormInput formInput,
    required EmptyAdditionalFormRelatedData additionalFormRelatedData,
  }) {
    return null;
  }

  @override
  OptValueWrap<Object>? extractMultiOptPropValueFromItemDetail({
    required String multiOptPropName,
    required SelectionType selectionType,
    required XData multiOptPropXData,
    required Object? parentMultiOptPropValue,
    required SupplierData itemDetail,
    required EmptyAdditionalFormRelatedData additionalFormRelatedData,
  }) {
    if (multiOptPropName == "supplierType") {
      return OptValueWrap<SupplierTypeInfo>.single(itemDetail.supplierType);
    }
    return null;
  }

  @override
  Map<String, SimpleValueWrap?>? extractUpdateValuesForSimpleProps({
    required Object? parentBlockCurrentItemId,
    required EmptyAdditionalFormRelatedData additionalFormRelatedData,
    required EmptyFormInput formInput,
  }) {
    return null;
  }

  @override
  Map<String, dynamic>? extractSimplePropValuesFromItemDetail({
    required Object? parentBlockCurrentItemId,
    required EmptyAdditionalFormRelatedData additionalFormRelatedData,
    required SupplierData itemDetail,
  }) {
    // SimpleFormPropDef<dynamic>(propName: "xFiles"), // or
    return {
      "id": itemDetail.id,
      "name": itemDetail.name,
      "email": itemDetail.email,
      "address": itemDetail.address,
      "phone": itemDetail.phone,
      "active": itemDetail.active,
      "description": itemDetail.description,
    };
  }

  @override
  OptValueWrap<Object>? specifyDefaultValueForMultiOptProp({
    required String multiOptPropName,
    required SelectionType selectionType,
    required XData multiOptPropXData,
    required Object? parentMultiOptPropValue,
  }) {
    return null;
  }

  @override
  Map<String, dynamic>? specifyDefaultValuesForSimpleProps({
    required Object? parentBlockCurrentItemId,
  }) {
    return null;
  }
}
