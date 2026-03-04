import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/rest_provider/note_rest_provider.dart';

import '../../../model/model.dart';

class Note42aQuickItemUpdateAction
    extends
        BlockQuickItemUpdateAction<
          int, //
          NoteInfo,
          NoteData,
          EmptyFilterCriteria
        > {
  final NoteInfo note;
  final String title;
  final String content;

  final _noteRestProvider = NoteRestProvider();

  Note42aQuickItemUpdateAction({
    required super.item,
    required super.config,
    required this.note,
    required this.title,
    required this.content,
    required super.needToConfirm,
    required super.actionInfo,
  });

  @override
  Future<ApiResult<NoteData>> performQuickUpdateItem({
    required Object? parentBlockItem,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return await _noteRestProvider.quickUpdateNote(
      id: note.id,
      title: title,
      content: content,
    );
  }

  @override
  CustomConfirmation? createCustomConfirmation() {
    return null;
  }
}
