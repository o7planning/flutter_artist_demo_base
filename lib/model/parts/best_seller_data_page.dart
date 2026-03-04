part of '../model.dart';

@JsonSerializable()
class BestSellerDataPage extends PageDataImpl<BestSellerData> {
  BestSellerDataPage({required super.items, required super.paginationInfo});

  factory BestSellerDataPage.fromJson(Map<String, dynamic> json) =>
      _$BestSellerDataPageFromJson(json);

  // IMPORTANT:
  Map<String, dynamic> toJson() => _$BestSellerDataPageToJson(this);
}
