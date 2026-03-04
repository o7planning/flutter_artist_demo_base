import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/employee_rest_provider.dart';
import '../filter_criteria/employee40a_filter_criteria.dart';
import '../filter_input/employee40a_filter_input.dart';

class Employee40aBlock
    extends
        Block<
          int, //
          EmployeeInfo,
          EmployeeData,
          Employee40aFilterInput,
          Employee40aFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const blkName = "employee40a-block";

  final employeeRestProvider = EmployeeRestProvider();

  Employee40aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  Future<ApiResult<PageData<EmployeeInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required Employee40aFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    return await employeeRestProvider.queryAdvanced(
      pageable: pageable,
      searchText: filterCriteria.searchText,
      companyId: filterCriteria.company?.id,
      departmentIdsAsString: filterCriteria.departmentIdsAsString,
    );
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required int itemId}) async {
    return await employeeRestProvider.delete(itemId);
  }

  @override
  Future<ApiResult<EmployeeData>> performLoadItemDetailById({
    required int itemId,
  }) async {
    return await employeeRestProvider.find(employeeId: itemId);
  }

  @override
  bool isItemDeletionAllowed({required EmployeeInfo item}) {
    return false;
  }

  @override
  EmployeeInfo convertItemDetailToItem({required EmployeeData itemDetail}) {
    return itemDetail;
  }

  @override
  Object extractParentBlockItemId({required EmployeeInfo fromThisBlockItem}) {
    throw FeatureUnsupportedException(
      "Not Care!, See the document for details",
    );
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required Employee40aFilterCriteria filterCriteria,
    required EmployeeData itemDetail,
  }) {
    return true;
  }

  @override
  EmptyFormInput buildInputForCreationForm({
    required Object? parentBlockCurrentItem,
    required Employee40aFilterCriteria filterCriteria,
  }) {
    return EmptyFormInput();
  }

  @override
  Future<EmptyFormRelatedData> performLoadFormRelatedData({
    required Object? parentBlockCurrentItem,
    required EmployeeData? currentItemDetail,
    required Employee40aFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
