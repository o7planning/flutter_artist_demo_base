part of '../model.dart';

@JsonSerializable()
class LessonInfo implements Identifiable<int> {
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

  LessonInfo(
    this.id,
    this.title,
    this.titleInEnglish,
    this.seqNum,
    this.locked,
    this.published,
    this.bookId,
  );

  LessonInfo.named({
    required this.id,
    required this.title,
    required this.titleInEnglish,
    required this.seqNum,
    required this.locked,
    required this.published,
    required this.bookId,
    required this.publishDate,
    required this.imagePath,
  });

  @override
  String toString() {
    return "${getClassName(this)}($id, $title)";
  }
}
