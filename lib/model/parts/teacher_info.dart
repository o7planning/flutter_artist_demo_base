part of '../model.dart';

@JsonSerializable()
class TeacherInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'fullName')
  String fullName;

  @JsonKey(name: 'birthday')
  String birthday;

  @JsonKey(name: 'gender')
  GenderInfo gender;

  @JsonKey(name: 'position')
  TeacherPositionInfo position;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'active')
  bool active;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  TeacherInfo(
    this.id,
    this.fullName,
    this.birthday,
    this.locked,
    this.active,
    this.gender,
    this.position,
  );

  TeacherInfo.named({
    required this.id,
    required this.fullName,
    required this.birthday,
    required this.locked,
    required this.active,
    required this.imagePath,
    required this.gender,
    required this.position,
  });

  factory TeacherInfo.fromJson(Map<String, dynamic> json) =>
      _$TeacherInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $fullName)";
  }
}
