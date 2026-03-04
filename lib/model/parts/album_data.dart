part of '../model.dart';

@JsonSerializable()
class AlbumData implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'seqNum')
  int seqNum;

  @JsonKey(name: "album")
  AlbumInfo album;

  @JsonKey(name: 'published')
  bool published;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(name: 'nameInEnglish')
  String? nameInEnglish;

  @JsonKey(name: 'publishedSongCount')
  int publishedSongCount;

  @JsonKey(name: 'totalSongCount')
  int totalSongCount;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'note')
  String? note;

  AlbumData(
    this.id,
    this.code,
    this.name,
    this.seqNum,
    this.published,
    this.locked,
    this.publishedSongCount,
    this.totalSongCount,
    this.album,
  );

  AlbumData.named({
    required this.id,
    required this.code,
    required this.name,
    required this.seqNum,
    required this.published,
    required this.locked,
    required this.publishedSongCount,
    required this.totalSongCount,
    required this.album,
    this.imagePath,
    this.description,
    this.note,
  });

  AlbumInfo toAlbumInfo() {
    return AlbumInfo.named(
      id: id,
      code: code,
      name: name,
      seqNum: seqNum,
      published: published,
      locked: locked,
      imagePath: imagePath,
    );
  }

  factory AlbumData.fromJson(Map<String, dynamic> json) =>
      _$AlbumDataFromJson(json);

  // IMPORTANT:
  Map<String, dynamic> toJson() => _$AlbumDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
