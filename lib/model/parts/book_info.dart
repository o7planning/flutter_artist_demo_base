part of '../model.dart';

@JsonSerializable()
class BookInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'seqNum')
  int seqNum;

  @JsonKey(name: 'published')
  bool published;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  BookInfo(
    this.id,
    this.code,
    this.title,
    this.seqNum,
    this.published,
    this.locked,
  );

  BookInfo.named({
    required this.id,
    required this.code,
    required this.title,
    required this.seqNum,
    required this.published,
    required this.locked,
    required this.imagePath,
  });

  factory BookInfo.fromJson(Map<String, dynamic> json) =>
      _$BookInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BookInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $title)";
  }
}
