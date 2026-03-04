part of '../model.dart';

@JsonSerializable()
class TeacherInfoPage extends PageDataImpl<TeacherInfo> {
  TeacherInfoPage({required super.items, required super.paginationInfo});

  factory TeacherInfoPage.fromJson(Map<String, dynamic> json) =>
      _$TeacherInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherInfoPageToJson(this);
}
