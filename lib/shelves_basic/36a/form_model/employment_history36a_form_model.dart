import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/company_rest_provider.dart';
import '../../../rest_provider/department_rest_provider.dart';
import '../../../rest_provider/employee_position_rest_provider.dart';
import '../../../rest_provider/employment_history_rest_provider.dart';

class EmploymentHistory36aFormModel
    extends
        FormModel<
          int, //
          EmploymentHistoryData,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  final _employeePositionRestProvider = EmployeePositionRestProvider();
  final _companyRestProvider = CompanyRestProvider();
  final _departmentRestProvider = DepartmentRestProvider();
  final _employmentHistoryRestProvider = EmploymentHistoryRestProvider();

  @override
  FormModelStructure defineFormModelStructure() {
    return FormModelStructure(
      simplePropDefs: [
        SimpleFormPropDef<int>(propName: "id"),
        SimpleFormPropDef<int>(propName: "employeeId"),
        SimpleFormPropDef<DateTime>(propName: "fromDate"),
        SimpleFormPropDef<DateTime>(propName: "toDate"),
      ],
      multiOptPropDefs: [
        // Multi Option Single Selection Prop.
        MultiOptFormPropDef<EmployeePositionInfo>.singleSelection(
          propName: 'employeePosition',
        ),
        // Multi Option Single Selection Prop.
        MultiOptFormPropDef<CompanyInfo>.singleSelection(
          propName: "company",
          children: [
            // Multi Option Single Selection Prop.
            MultiOptFormPropDef<DepartmentInfo>.singleSelection(
              propName: "department",
            ),
          ],
        ),
      ],
    );
  }

  @override
  Future<ApiResult<EmploymentHistoryData>> performCreateItem({
    required Map<String, dynamic> formMapData,
  }) async {
    return await _employmentHistoryRestProvider.createEmploymentHistory(
      formMapData,
    );
  }

  @override
  Future<ApiResult<EmploymentHistoryData>> performUpdateItem({
    required Map<String, dynamic> formMapData,
  }) async {
    return await _employmentHistoryRestProvider.updateEmploymentHistory(
      formMapData,
    );
  }

  @override
  Future<XData?> performLoadMultiOptPropXData({
    required String multiOptPropName,
    required SelectionType selectionType,
    required Object? parentMultiOptPropValue,
    required EmptyFormInput? formInput,
    required EmploymentHistoryData? itemDetail,
    required EmptyFormRelatedData formRelatedData,
  }) async {
    if (multiOptPropName == "employeePosition") {
      ApiResult<EmployeePositionInfoPage> result =
          await _employeePositionRestProvider.queryAll();
      // IMPORTANT:
      result.throwIfError();
      // IMPORTANT: Generics should be declared explicitly.
      return ListXData<int, EmployeePositionInfo>.fromPageData(
        pageData: result.data,
        getItemId: (item) => item.id,
      );
    } else if (multiOptPropName == "company") {
      ApiResult<CompanyInfoPage> result = await _companyRestProvider.queryAll();
      // IMPORTANT:
      result.throwIfError();
      // IMPORTANT: Generics should be declared explicitly.
      return ListXData<int, CompanyInfo>.fromPageData(
        pageData: result.data,
        getItemId: (item) => item.id,
      );
    } else if (multiOptPropName == "department") {
      CompanyInfo company = parentMultiOptPropValue as CompanyInfo;
      ApiResult<DepartmentInfoPage> result = await _departmentRestProvider
          .queryAllByCompanyId(companyId: company.id);
      // IMPORTANT:
      result.throwIfError();
      // IMPORTANT: Generics should be declared explicitly.
      return ListXData<int, DepartmentInfo>.fromPageData(
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
    required EmploymentHistoryData itemDetail,
    required EmptyFormRelatedData formRelatedData,
  }) {
    return {
      "id": itemDetail.id,
      "employeeId": itemDetail.employee.id,
      "fromDate": itemDetail.fromDate,
      "toDate": itemDetail.toDate,
    };
  }

  @override
  OptValueWrap? extractMultiOptPropValueFromItemDetail({
    required String multiOptPropName,
    required SelectionType selectionType,
    required XData multiOptPropXData,
    required Object? parentMultiOptPropValue,
    required EmploymentHistoryData itemDetail,
    required EmptyFormRelatedData formRelatedData,
  }) {
    if (multiOptPropName == "employeePosition") {
      // Use "OptValueWrap.single" for MultiOptFormPropDef.singleSelection:
      return OptValueWrap.single(itemDetail.employeePosition);
    } else if (multiOptPropName == "company") {
      // Use "OptValueWrap.single" for MultiOptFormPropDef.singleSelection:
      return OptValueWrap.single(itemDetail.company);
    } else if (multiOptPropName == "department") {
      // Use "OptValueWrap.single" for MultiOptFormPropDef.singleSelection:
      return OptValueWrap.single(itemDetail.department);
    }
    return null;
  }

  @override
  Map<String, dynamic>? specifyDefaultValuesForSimpleProps({
    required Object? parentBlockCurrentItemId,
  }) {
    return {"employeeId": parentBlockCurrentItemId};
  }
}
