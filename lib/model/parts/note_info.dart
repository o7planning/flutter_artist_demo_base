part of '../model.dart';

@JsonSerializable()
class NoteInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'createDateTime')
  String createDateTime;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'colorCode')
  String colorCode;

  NoteInfo(
    this.id,
    this.title,
    this.createDateTime,
    this.content,
    this.colorCode,
  );

  NoteInfo.named({
    required this.id,
    required this.title,
    required this.createDateTime,
    required this.content,
    required this.colorCode,
  });

  factory NoteInfo.fromJson(Map<String, dynamic> json) =>
      _$NoteInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NoteInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $title)";
  }
}
