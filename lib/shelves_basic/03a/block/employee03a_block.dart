import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/employee_rest_provider.dart';
import '../filter_criteria/employee03a_filter_criteria.dart';

class Employee03aBlock
    extends
        Block<
          int, //
          EmployeeInfo,
          EmployeeData,
          EmptyFilterInput,
          Employee03aFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const blkName = "employee03a-block";

  final employeeRestProvider = EmployeeRestProvider();

  Employee03aBlock({
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
    required Employee03aFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    return await employeeRestProvider.query(
      searchText: filterCriteria.searchText,
      companyId: filterCriteria.company?.id,
      departmentId: filterCriteria.department?.id,
      pageable: pageable,
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
    required Employee03aFilterCriteria filterCriteria,
    required EmployeeData itemDetail,
  }) {
    return true;
  }

  @override
  EmptyFormInput buildInputForCreationForm({
    required Object? parentBlockCurrentItem,
    required Employee03aFilterCriteria filterCriteria,
  }) {
    return EmptyFormInput();
  }

  @override
  Future<EmptyFormRelatedData> performLoadFormRelatedData({
    required Object? parentBlockCurrentItem,
    required EmployeeData? currentItemDetail,
    required Employee03aFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
