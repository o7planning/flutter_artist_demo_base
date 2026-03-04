part of '../model.dart';

@JsonSerializable()
class AlbumInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'seqNum')
  int seqNum;

  @JsonKey(name: 'published')
  bool published;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  AlbumInfo(
    this.id,
    this.code,
    this.name,
    this.seqNum,
    this.published,
    this.locked,
  );

  AlbumInfo.named({
    required this.id,
    required this.code,
    required this.name,
    required this.seqNum,
    required this.published,
    required this.locked,
    required this.imagePath,
  });

  factory AlbumInfo.fromJson(Map<String, dynamic> json) =>
      _$AlbumInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
