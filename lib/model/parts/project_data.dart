part of '../model.dart';

@JsonSerializable()
class ProjectData extends ProjectInfo {
  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'note')
  String? note;

  ProjectData(super.id, super.code, super.name, this.description, this.note);

  factory ProjectData.fromJson(Map<String, dynamic> json) =>
      _$ProjectDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
