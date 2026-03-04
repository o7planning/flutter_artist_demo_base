import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/rest_provider/company_rest_provider.dart';

import '../../../model/model.dart';
import '../../../rest_provider/department_rest_provider.dart';
import '../../../rest_provider/employee_rest_provider.dart';
import '../form_input/department_form_input.dart';
import '../form_related_data/department_form_related_data.dart';

class SingleDepartmentFormModel
    extends
        FormModel<
          int, //
          DepartmentData,
          DepartmentFormInput,
          DepartmentFormRelatedData
        > {
  final _companyRestProvider = CompanyRestProvider();
  final _employeeRestProvider = EmployeeRestProvider();
  final _departmentRestProvider = DepartmentRestProvider();

  CompanyInfo? company;

  // Data for Dropdown
  ListXData<int, EmployeeInfo>? employeeInfoListXData;

  @override
  FormModelStructure defineFormModelStructure() {
    return FormModelStructure(
      simplePropDefs: [
        SimpleFormPropDef<int>(propName: "id"),
        SimpleFormPropDef<String>(propName: "code"),
        SimpleFormPropDef<String>(propName: "name"),
        SimpleFormPropDef<EmployeeInfo>(propName: "manager"),
        SimpleFormPropDef<String>(propName: "description"),
      ],
      multiOptPropDefs: [],
    );
  }

  @override
  Future<ApiResult<DepartmentData>> performCreateItem({
    required Map<String, dynamic> formMapData,
  }) async {
    return await _departmentRestProvider.createDepartment(formMapData);
  }

  @override
  Future<ApiResult<DepartmentData>> performUpdateItem({
    required Map<String, dynamic> formMapData,
  }) async {
    return await _departmentRestProvider.updateDepartment(formMapData);
  }

  @override
  Future<XData?> performLoadMultiOptPropXData({
    required String multiOptPropName,
    required SelectionType selectionType,
    required Object? parentMultiOptPropValue,
    required DepartmentFormInput? formInput,
    required DepartmentData? itemDetail,
    required DepartmentFormRelatedData formRelatedData,
  }) async {
    throw UnimplementedError();
  }

  @override
  OptValueWrap? extractUpdateValueForMultiOptProp({
    required String multiOptPropName,
    required SelectionType selectionType,
    required XData multiOptPropXData,
    required Object? parentBlockCurrentItemId,
    required Object? parentMultiOptPropValue,
    required DepartmentFormInput formInput,
    required DepartmentFormRelatedData formRelatedData,
  }) {
    throw UnimplementedError();
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
    required DepartmentFormInput formInput,
    required DepartmentFormRelatedData formRelatedData,
  }) {
    return null;
  }

  @override
  Map<String, dynamic>? extractSimplePropValuesFromItemDetail({
    required Object? parentBlockCurrentItemId,
    required DepartmentData itemDetail,
    required DepartmentFormRelatedData formRelatedData,
  }) {
    return {
      "id": itemDetail.id,
      "code": itemDetail.code,
      "name": itemDetail.name,
      "description": itemDetail.description,
    };
  }

  @override
  OptValueWrap? extractMultiOptPropValueFromItemDetail({
    required String multiOptPropName,
    required SelectionType selectionType,
    required XData multiOptPropXData,
    required Object? parentMultiOptPropValue,
    required DepartmentData itemDetail,
    required DepartmentFormRelatedData formRelatedData,
  }) {
    if (multiOptPropName == "company") {
      var listXData = multiOptPropXData as ListXData<int, CompanyInfo>;
      return OptValueWrap.single(
        listXData.findInternalItemByItemId(itemDetail.companyId),
      );
    } else if (multiOptPropName == "manager") {
      return OptValueWrap.single(itemDetail.manager);
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
