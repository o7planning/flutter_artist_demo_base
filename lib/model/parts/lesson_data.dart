part of '../model.dart';

@JsonSerializable()
class LessonData implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'titleInEnglish')
  String? titleInEnglish;

  @JsonKey(name: 'seqNum')
  int seqNum;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'published')
  bool published;

  @JsonKey(
    name: 'publishDate',
    fromJson: __stringToNullableDateTime,
    toJson: __dateTimeToNullableString,
  )
  DateTime? publishDate;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(name: 'bookId')
  int bookId;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'note')
  String? note;

  LessonData(
    this.id,
    this.title,
    this.titleInEnglish,
    this.seqNum,
    this.locked,
    this.published,
    this.bookId,
  );

  LessonData.named({
    required this.id,
    required this.title,
    required this.titleInEnglish,
    required this.seqNum,
    required this.locked,
    required this.published,
    required this.bookId,
    this.publishDate,
    this.imagePath,
    this.description,
    this.note,
  });

  LessonInfo toLessonInfo() {
    return LessonInfo.named(
      id: id,
      title: title,
      titleInEnglish: titleInEnglish,
      seqNum: seqNum,
      locked: locked,
      published: published,
      bookId: bookId,
      publishDate: publishDate,
      imagePath: imagePath,
    );
  }

  factory LessonData.fromJson(Map<String, dynamic> json) =>
      _$LessonDataFromJson(json);

  Map<String, dynamic> toJson() => _$LessonDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $title)";
  }
}
