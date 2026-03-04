part of '../model.dart';

@JsonSerializable()
class CategoryInfoPage extends PageDataImpl<CategoryInfo> {
  CategoryInfoPage({required super.items, required super.paginationInfo});

  factory CategoryInfoPage.fromJson(Map<String, dynamic> json) =>
      _$CategoryInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryInfoPageToJson(this);
}
