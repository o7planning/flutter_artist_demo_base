import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/rest_provider/note_rest_provider.dart';

import '../../../model/model.dart';

class Note42aQuickItemCreationAction
    extends
        BlockQuickItemCreationAction<
          int, //
          NoteInfo,
          NoteData,
          EmptyFilterCriteria
        > {
  final String title;
  final String content;

  final _noteRestProvider = NoteRestProvider();

  Note42aQuickItemCreationAction({
    required this.title,
    required this.content,
    required super.needToConfirm,
    required super.actionInfo,
  });

  @override
  Future<ApiResult<NoteData>> performQuickCreateItem({
    required Object? parentBlockItem,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return await _noteRestProvider.quickCreateNote(
      title: title,
      content: content,
    );
  }

  @override
  CustomConfirmation? createCustomConfirmation() {
    return null;
  }
}
