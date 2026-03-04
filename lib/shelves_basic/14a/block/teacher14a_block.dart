import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/teacher_rest_provider.dart';
import '../filter_criteria/teacher14a_filter_criteria.dart';

class Teacher14aBlock
    extends
        Block<
          int, //
          TeacherInfo,
          TeacherData,
          EmptyFilterInput,
          Teacher14aFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const String blkName = "teacher14a-block";

  final teacherRestProvider = TeacherRestProvider();

  Teacher14aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  Future<ApiResult<PageData<TeacherInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required Teacher14aFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    return await teacherRestProvider.querySearch(
      pageable: pageable,
      searchText: filterCriteria.searchText,
      universityId: filterCriteria.university?.id,
    );
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required int itemId}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<TeacherData>> performLoadItemDetailById({
    required int itemId,
  }) async {
    return await teacherRestProvider.find(teacherId: itemId);
  }

  @override
  TeacherInfo convertItemDetailToItem({required TeacherData itemDetail}) {
    return itemDetail.toTeacherInfo();
  }

  @override
  Object extractParentBlockItemId({required TeacherInfo fromThisBlockItem}) {
    throw FeatureUnsupportedException(
      "Not Care!, See the document for details",
    );
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required Teacher14aFilterCriteria filterCriteria,
    required TeacherData itemDetail,
  }) {
    return true;
  }

  @override
  EmptyFormInput buildInputForCreationForm({
    required Object? parentBlockCurrentItem,
    required Teacher14aFilterCriteria filterCriteria,
  }) {
    return EmptyFormInput();
  }

  @override
  Future<EmptyFormRelatedData> performLoadFormRelatedData({
    required Object? parentBlockCurrentItem,
    required TeacherData? currentItemDetail,
    required Teacher14aFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
