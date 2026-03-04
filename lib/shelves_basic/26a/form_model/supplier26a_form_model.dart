import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:get/get.dart';

import '../../../model/model.dart';
import '../../../rest_provider/supplier_rest_provider.dart';
import '../../../rest_provider/supplier_type_rest_provider.dart';
import '../form_input/supplier26a_form_input.dart';

class Supplier26aFormModel
    extends
        FormModel<
          int, //
          SupplierData,
          Supplier26aFormInput,
          EmptyFormRelatedData
        > {
  final _supplierProvider = SupplierRestProvider();
  final _supplierTypeProvider = SupplierTypeRestProvider();

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
        // List<XFile>
        SimpleFormPropDef<dynamic>(propName: "xFiles"),
      ],
      multiOptPropDefs: [
        // Multi Option Single Selection Prop.
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
    return await _supplierProvider.createSupplier(formMapData);
  }

  @override
  Future<ApiResult<SupplierData>> performUpdateItem({
    required Map<String, dynamic> formMapData,
  }) async {
    return await _supplierProvider.updateSupplier(formMapData);
  }

  @override
  Future<XData?> performLoadMultiOptPropXData({
    required String multiOptPropName,
    required SelectionType selectionType,
    required Object? parentMultiOptPropValue,
    required Supplier26aFormInput? formInput,
    required SupplierData? itemDetail,
    required EmptyFormRelatedData formRelatedData,
  }) async {
    if (multiOptPropName == "supplierType") {
      ApiResult<SupplierTypeInfoPage> result = await _supplierTypeProvider
          .queryAll();
      result.throwIfError();
      //
      return ListXData<int, SupplierTypeInfo>.fromPageData(
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
    required Supplier26aFormInput formInput,
    required EmptyFormRelatedData formRelatedData,
  }) {
    if (multiOptPropName == "supplierType") {
      var listXData = multiOptPropXData as ListXData<int, SupplierTypeInfo>;

      SupplierTypeInfo? supplierType = listXData.data.firstWhereOrNull(
        (s) => s.code == formInput.supplierTypeCode,
      );
      return OptValueWrap.single(supplierType);
    }
    return null;
  }

  @override
  Map<String, SimpleValueWrap?>? extractUpdateValuesForSimpleProps({
    required Object? parentBlockCurrentItemId,
    required Supplier26aFormInput formInput,
    required EmptyFormRelatedData formRelatedData,
  }) {
    return {
      "email": SimpleValueWrap.useIfNotNull(formInput.email),
      "address": SimpleValueWrap.useIfNotNull(formInput.address),
      "phone": SimpleValueWrap.useIfNotNull(formInput.phone),
    };
  }

  @override
  OptValueWrap? specifyDefaultValueForMultiOptProp({
    required String multiOptPropName,
    required SelectionType selectionType,
    required XData multiOptPropXData,
    required Object? parentMultiOptPropValue,
  }) {
    if (multiOptPropName == "supplierType") {
      // Test null:
      // IMPORTANT: NO change:
      return OptValueWrap.single(null);
    }
    return null;
  }

  @override
  Map<String, dynamic>? extractSimplePropValuesFromItemDetail({
    required Object? parentBlockCurrentItemId,
    required SupplierData itemDetail,
    required EmptyFormRelatedData formRelatedData,
  }) {
    return {
      "id": itemDetail.id,
      "name": itemDetail.name,
      "email": itemDetail.email,
      "address": itemDetail.address,
      "phone": itemDetail.phone,
      "active": itemDetail.active,
      "description": itemDetail.description,
      "xFiles": null,
    };
  }

  @override
  OptValueWrap? extractMultiOptPropValueFromItemDetail({
    required String multiOptPropName,
    required SelectionType selectionType,
    required XData multiOptPropXData,
    required Object? parentMultiOptPropValue,
    required SupplierData itemDetail,
    required EmptyFormRelatedData formRelatedData,
  }) {
    if (multiOptPropName == "supplierType") {
      return OptValueWrap.single(itemDetail.supplierType);
    }
    return null;
  }

  @override
  Map<String, dynamic>? specifyDefaultValuesForSimpleProps({
    required Object? parentBlockCurrentItemId,
  }) {
    return null;
  }
}
