import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/employee_rest_provider.dart';
import '../filter_criteria/employee59a_filter_criteria.dart';

class Employee59aBlock
    extends
        Block<
          int, //
          EmployeeInfo,
          EmployeeData,
          EmptyFilterInput,
          Employee59aFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const blkName = "employee59a-block";

  final employeeRestProvider = EmployeeRestProvider();

  Employee59aBlock({
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
    required Employee59aFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    return await employeeRestProvider.queryWithFieldBasedJSON(
      pageable: pageable,
      fieldBasedJSON: filterCriteria.fieldBasedJSON,
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
    required Employee59aFilterCriteria filterCriteria,
    required EmployeeData itemDetail,
  }) {
    return true;
  }

  @override
  EmptyFormInput buildInputForCreationForm({
    required Object? parentBlockCurrentItem,
    required Employee59aFilterCriteria filterCriteria,
  }) {
    return EmptyFormInput();
  }

  @override
  Future<EmptyFormRelatedData> performLoadFormRelatedData({
    required Object? parentBlockCurrentItem,
    required EmployeeData? currentItemDetail,
    required Employee59aFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
