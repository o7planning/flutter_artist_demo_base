part of '../model.dart';

@JsonSerializable()
class UniversityInfo implements Identifiable<int> {
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

  UniversityInfo(this.id, this.code, this.name, this.active, this.locked);

  UniversityInfo.named({
    required this.id,
    required this.code,
    required this.name,
    required this.active,
    required this.locked,
    required this.imagePath,
  });

  factory UniversityInfo.fromJson(Map<String, dynamic> json) =>
      _$UniversityInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
