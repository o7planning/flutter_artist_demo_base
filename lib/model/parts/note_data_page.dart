part of '../model.dart';

@JsonSerializable()
class NoteInfoPage extends PageDataImpl<NoteInfo> {
  NoteInfoPage({required super.items, required super.paginationInfo});

  factory NoteInfoPage.fromJson(Map<String, dynamic> json) =>
      _$NoteInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$NoteInfoPageToJson(this);
}
