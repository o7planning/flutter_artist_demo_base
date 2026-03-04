part of '../model.dart';

@JsonSerializable()
class CategoryData extends CategoryInfo {
  @JsonKey(name: 'description')
  String? description;

  CategoryData(super.id, super.name, super.imagePath);

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
