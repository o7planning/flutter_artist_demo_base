import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/note_rest_provider.dart';

class Note42aBlock
    extends
        Block<
          int,
          NoteInfo, // ITEM
          NoteData, // ITEM_DETAIL
          EmptyFilterInput,
          EmptyFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const String blkName = "note42a-block";

  final _noteRestProvider = NoteRestProvider();

  Note42aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  Future<ApiResult<PageData<NoteInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required EmptyFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    return await _noteRestProvider.queryAll();
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required int itemId}) async {
    return await _noteRestProvider.delete(itemId);
  }

  @override
  Future<ApiResult<NoteData>> performLoadItemDetailById({
    required int itemId,
  }) async {
    return await _noteRestProvider.find(noteId: itemId);
  }

  @override
  NoteInfo convertItemDetailToItem({required NoteData itemDetail}) {
    return itemDetail.toNoteInfo();
  }

  @override
  Object extractParentBlockItemId({required NoteInfo fromThisBlockItem}) {
    throw FeatureUnsupportedException(
      "Not Care!, See the document for details",
    );
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required EmptyFilterCriteria filterCriteria,
    required NoteData itemDetail,
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
    required NoteData? currentItemDetail,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
