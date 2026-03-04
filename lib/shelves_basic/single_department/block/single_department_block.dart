import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/department_rest_provider.dart';
import '../filter_criteria/single_department_filter_criteria.dart';
import '../filter_input/single_department_filter_input.dart';
import '../form_input/department_form_input.dart';
import '../form_related_data/department_form_related_data.dart';

class SingleDepartmentBlock
    extends
        SingleItemBlock<
          int, //
          DepartmentData,
          SingleDepartmentFilterInput,
          SingleDepartmentFilterCriteria,
          DepartmentFormInput,
          DepartmentFormRelatedData
        > {
  static const String blkName = "single-department-block";

  final departmentRestProvider = DepartmentRestProvider();

  SingleDepartmentBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  bool isItemDeletionAllowed({required DepartmentData item}) {
    return false;
  }

  @override
  Future<ApiResult<DepartmentData>> performQuerySingleItem({
    required Object? parentBlockCurrentItem,
    required SingleDepartmentFilterCriteria filterCriteria,
  }) async {
    if (filterCriteria.departmentId == null) {
      return ApiResult.success(data: null);
    }
    return await departmentRestProvider.find(
      departmentId: filterCriteria.departmentId!,
    );
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required int itemId}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<DepartmentData>> performLoadItemDetailById({
    required int itemId,
  }) async {
    return await departmentRestProvider.find(departmentId: itemId);
  }

  @override
  DepartmentData convertItemDetailToItem({required DepartmentData itemDetail}) {
    return itemDetail;
  }

  @override
  Object extractParentBlockItemId({required DepartmentData fromThisBlockItem}) {
    throw FeatureUnsupportedException(
      "Not Care!, See the document for details",
    );
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required SingleDepartmentFilterCriteria filterCriteria,
    required DepartmentData itemDetail,
  }) {
    return true;
  }

  @override
  DepartmentFormInput buildInputForCreationForm({
    required Object? parentBlockCurrentItem,
    required SingleDepartmentFilterCriteria filterCriteria,
  }) {
    throw UnimplementedError("Department creation is not supported");
  }

  @override
  Future<DepartmentFormRelatedData> performLoadFormRelatedData({
    required Object? parentBlockCurrentItem,
    required DepartmentData? currentItemDetail,
    required SingleDepartmentFilterCriteria filterCriteria,
  }) async {
    throw UnimplementedError("TODO");
  }
}
