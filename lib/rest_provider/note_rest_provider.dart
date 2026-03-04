import 'package:dio/dio.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../config/fa_dio.dart';
import '../model/model.dart';

class NoteRestProvider {
  // /rest/noteDataPage/all
  Future<ApiResult<NoteInfoPage>> queryAll() async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/noteInfoPage/all
    ApiResult<NoteInfoPage> result = await flutterArtistDio.jsonGet(
      "/rest/noteInfoPage/all",
      queryParameters: queryParameters,
      converter: NoteInfoPage.fromJson,
    );
    return result;
  }

  // /rest/note/1
  Future<ApiResult<NoteData>> find({required int noteId}) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/note/1
    ApiResult<NoteData> result = await flutterArtistDio.jsonGet(
      "/rest/note/$noteId",
      queryParameters: queryParameters,
      converter: NoteData.fromJson,
    );
    return result;
  }

  Future<ApiResult<NoteData>> quickCreateNote({
    required String title,
    required String content,
  }) async {
    var formData = FormData.fromMap({"title": title, "content": content});
    // /rest/note/quickCreate
    ApiResult<NoteData> result = await flutterArtistDio.jsonPost(
      "/rest/note/quickCreate",
      queryParameters: null,
      data: formData,
      converter: NoteData.fromJson,
      showDebug: true,
    );
    return result;
  }

  Future<ApiResult<NoteData>> quickUpdateNote({
    required int id,
    required String title,
    required String content,
  }) async {
    var formData = FormData.fromMap({
      "id": id,
      "title": title,
      "content": content,
    });
    // /rest/note/quickUpdate
    ApiResult<NoteData> result = await flutterArtistDio.jsonPut(
      "/rest/note/quickUpdate",
      queryParameters: null,
      data: formData,
      converter: NoteData.fromJson,
      showDebug: true,
    );
    return result;
  }

  Future<ApiResult<void>> delete(int noteId) async {
    Map<String, dynamic>? queryParameters = {};

    // /rest/note/delete/noteId
    ApiResult<void> result = await flutterArtistDio.jsonDelete(
      "/rest/note/delete/$noteId",
      queryParameters: queryParameters,
      converter: null,
    );
    return result;
  }
}
