part of '../model.dart';

@JsonSerializable()
class SongData implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'published')
  bool published;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'note')
  String? note;

  @JsonKey(name: 'youtubeCode')
  String? youtubeCode;

  @JsonKey(name: 'youtubeVideoInfo')
  String? youtubeVideoInfo;

  @JsonKey(name: "album")
  AlbumInfo album;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  SongData(this.id, this.name, this.locked, this.published, this.album);

  SongData.named({
    required this.id,
    required this.name,
    required this.locked,
    required this.published,
    required this.album,
    this.imagePath,
    this.description,
    this.note,
    this.youtubeCode,
    this.youtubeVideoInfo,
  });

  SongInfo toSongInfo() {
    return SongInfo.named(
      id: id,
      name: name,
      albumId: album.id,
      locked: locked,
      published: published,
      imagePath: imagePath,
    );
  }

  factory SongData.fromJson(Map<String, dynamic> json) =>
      _$SongDataFromJson(json);

  Map<String, dynamic> toJson() => _$SongDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
