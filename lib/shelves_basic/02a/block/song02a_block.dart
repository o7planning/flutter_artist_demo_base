import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/song_rest_provider.dart';
import '../filter_criteria/song02a_filter_criteria.dart';

class Song02aBlock
    extends
        Block<
          int, //
          SongInfo,
          SongData,
          EmptyFilterInput,
          Song02aFilterCriteria,
          EmptyFormInput,
          EmptyFormRelatedData
        > {
  static const String blkName = "song02a-block";

  final songRestProvider = SongRestProvider();

  Song02aBlock({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
    required super.formModel,
    required super.childBlocks,
  });

  @override
  Future<ApiResult<PageData<SongInfo>?>> performQuery({
    required Object? parentBlockCurrentItem,
    required Song02aFilterCriteria filterCriteria,
    required SortableCriteria sortableCriteria,
    required Pageable pageable,
  }) async {
    return await songRestProvider.querySearch(
      pageable: pageable,
      searchText: filterCriteria.searchText,
      albumId: filterCriteria.album?.id,
    );
  }

  @override
  Future<ApiResult<void>> performDeleteItemById({required int itemId}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<SongData>> performLoadItemDetailById({
    required int itemId,
  }) async {
    return await songRestProvider.find(songId: itemId);
  }

  @override
  SongInfo convertItemDetailToItem({required SongData itemDetail}) {
    return itemDetail.toSongInfo();
  }

  @override
  Object extractParentBlockItemId({required SongInfo fromThisBlockItem}) {
    return fromThisBlockItem.albumId;
  }

  @override
  bool needToKeepItemInList({
    required Object? parentBlockCurrentItemId,
    required Song02aFilterCriteria filterCriteria,
    required SongData itemDetail,
  }) {
    return true;
  }

  @override
  EmptyFormInput buildInputForCreationForm({
    required Object? parentBlockCurrentItem,
    required Song02aFilterCriteria filterCriteria,
  }) {
    return EmptyFormInput();
  }

  @override
  Future<EmptyFormRelatedData> performLoadFormRelatedData({
    required Object? parentBlockCurrentItem,
    required SongData? currentItemDetail,
    required Song02aFilterCriteria filterCriteria,
  }) async {
    return EmptyFormRelatedData();
  }
}
