part of '../model.dart';

@JsonSerializable()
class UniversityInfoPage extends PageDataImpl<UniversityInfo> {
  UniversityInfoPage({required super.items, required super.paginationInfo});

  factory UniversityInfoPage.fromJson(Map<String, dynamic> json) =>
      _$UniversityInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityInfoPageToJson(this);
}
