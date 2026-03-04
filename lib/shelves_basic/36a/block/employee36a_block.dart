import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/employee_rest_provider.dart';

class Employee36aBlock
    extends
        Block<
          int, //
          EmployeeInfo,
          EmployeeData,
          EmptyFilterInput,
          EmptyFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const blkName = "employee36a-block";

  final employeeRestProvider = EmployeeRestProvider();

  Employee36aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  bool isItemDeletionAllowed({required EmployeeInfo item}) {
    return false;
  }

  @override
  Future<ApiResult<PageData<EmployeeInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required EmptyFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    return await employeeRestProvider.query(
      pageable: pageable,
      searchText: null,
      companyId: null,
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
    required EmptyFilterCriteria filterCriteria,
    required EmployeeData itemDetail,
  }) {
    return true;
  }

  @override
  EmptyFormInput buildInputForCreationForm({
    required Object? parentBlockCurrentItem,
    required EmptyFilterCriteria filterCriteria,
  }) {
    return EmptyFormInput();
  }

  @override
  Future<EmptyFormRelatedData> performLoadFormRelatedData({
    required Object? parentBlockCurrentItem,
    required EmployeeData? currentItemDetail,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
