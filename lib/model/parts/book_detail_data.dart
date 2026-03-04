part of '../model.dart';

@JsonSerializable()
class BookDetailData extends BookData {
  @JsonKey(name: 'lessons', defaultValue: [])
  List<LessonData> lessons = [];

  BookDetailData(
    super.id,
    super.code,
    super.title,
    super.seqNum,
    super.published,
    super.locked,
  );

  factory BookDetailData.fromJson(Map<String, dynamic> json) =>
      _$BookDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$BookDetailDataToJson(this);
}
