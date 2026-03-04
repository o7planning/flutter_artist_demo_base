part of '../model.dart';

@JsonSerializable()
class BestSellingDataPage extends PageDataImpl<BestSellingData> {
  BestSellingDataPage({required super.items, required super.paginationInfo});

  factory BestSellingDataPage.fromJson(Map<String, dynamic> json) =>
      _$BestSellingDataPageFromJson(json);

  // IMPORTANT:
  Map<String, dynamic> toJson() => _$BestSellingDataPageToJson(this);
}
