part of '../model.dart';

@JsonSerializable()
class NoteData implements Identifiable<int> {
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

  NoteData(
    this.id,
    this.title,
    this.createDateTime,
    this.content,
    this.colorCode,
  );

  NoteData.named({
    required this.id,
    required this.title,
    required this.createDateTime,
    required this.content,
    required this.colorCode,
  });

  NoteInfo toNoteInfo() {
    return NoteInfo.named(
      id: id,
      title: title,
      createDateTime: createDateTime,
      content: content,
      colorCode: colorCode,
    );
  }

  factory NoteData.fromJson(Map<String, dynamic> json) =>
      _$NoteDataFromJson(json);

  Map<String, dynamic> toJson() => _$NoteDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $title)";
  }
}
