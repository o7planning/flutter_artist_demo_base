part of '../model.dart';

@JsonSerializable()
class TeacherPositionInfo {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  TeacherPositionInfo(this.id, this.name);

  TeacherPositionInfo.named({required this.id, required this.name});

  factory TeacherPositionInfo.fromJson(Map<String, dynamic> json) =>
      _$TeacherPositionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherPositionInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
