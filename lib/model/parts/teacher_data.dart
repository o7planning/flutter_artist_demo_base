part of '../model.dart';

@JsonSerializable()
class TeacherData implements Identifiable<int> {
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

  @JsonKey(name: 'universityId')
  int universityId;

  @JsonKey(name: 'country')
  CountryInfo? country;

  @JsonKey(name: 'youtubeVideoCode')
  String? youtubeVideoCode;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'skype')
  String? skype;

  @JsonKey(name: 'facebook')
  String? facebook;

  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'note')
  String? note;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  TeacherData(
    this.id,
    this.fullName,
    this.birthday,
    this.gender,
    this.position,
    this.email,
    this.locked,
    this.active,
    this.universityId,
  );

  TeacherData.named({
    required this.id,
    required this.fullName,
    required this.birthday,
    required this.gender,
    required this.position,
    required this.email,
    required this.locked,
    required this.active,
    required this.universityId,
    this.imagePath,
    this.description,
    this.note,
    this.youtubeVideoCode,
    this.skype,
    this.facebook,
    this.phoneNumber,
  });

  TeacherInfo toTeacherInfo() {
    return TeacherInfo.named(
      id: id,
      fullName: fullName,
      birthday: birthday,
      gender: gender,
      position: position,
      locked: locked,
      active: active,
      imagePath: imagePath,
    );
  }

  factory TeacherData.fromJson(Map<String, dynamic> json) =>
      _$TeacherDataFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $fullName)";
  }
}
