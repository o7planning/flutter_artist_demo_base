part of '../model.dart';

@JsonSerializable()
class UniversityData implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'active')
  bool active;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(name: 'nameInEnglish')
  String? nameInEnglish;

  @JsonKey(name: 'activeSongCount')
  int activeSongCount;

  @JsonKey(name: 'totalSongCount')
  int totalSongCount;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'note')
  String? note;

  UniversityData(
    this.id,
    this.code,
    this.name,
    this.active,
    this.locked,
    this.activeSongCount,
    this.totalSongCount,
  );

  UniversityData.named({
    required this.id,
    required this.code,
    required this.name,
    required this.active,
    required this.locked,
    required this.activeSongCount,
    required this.totalSongCount,
    this.imagePath,
    this.description,
    this.note,
  });

  UniversityInfo toUniversityInfo() {
    return UniversityInfo.named(
      id: id,
      code: code,
      name: name,
      locked: locked,
      active: active,
      imagePath: imagePath,
    );
  }

  factory UniversityData.fromJson(Map<String, dynamic> json) =>
      _$UniversityDataFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
