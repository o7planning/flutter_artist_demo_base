import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/supplier_rest_provider.dart';
import '../../../rest_provider/supplier_type_rest_provider.dart';

class Supplier11aFormModel
    extends
        FormModel<
          int, //
          SupplierData,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  final _supplierRestProvider = SupplierRestProvider();
  final _supplierTypeRestProvider = SupplierTypeRestProvider();

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
        // dynamic or List<XFile>
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
    return await _supplierRestProvider.createSupplier(formMapData);
  }

  @override
  Future<ApiResult<SupplierData>> performUpdateItem({
    required Map<String, dynamic> formMapData,
  }) async {
    return await _supplierRestProvider.updateSupplier(formMapData);
  }

  @override
  Future<XData?> performLoadMultiOptPropXData({
    required String multiOptPropName,
    required SelectionType selectionType,
    required Object? parentMultiOptPropValue,
    required EmptyFormInput? formInput,
    required SupplierData? itemDetail,
    required EmptyFormRelatedData formRelatedData,
  }) async {
    if (multiOptPropName == "supplierType") {
      ApiResult<SupplierTypeInfoPage> result = await _supplierTypeRestProvider
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
