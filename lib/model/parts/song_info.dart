part of '../model.dart';

@JsonSerializable()
class SongInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'albumId')
  int albumId;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'published')
  bool published;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  SongInfo(this.id, this.name, this.albumId, this.locked, this.published);

  SongInfo.named({
    required this.id,
    required this.name,
    required this.albumId,
    required this.locked,
    required this.published,
    required this.imagePath,
  });

  factory SongInfo.fromJson(Map<String, dynamic> json) =>
      _$SongInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SongInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
