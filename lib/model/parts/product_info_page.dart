part of '../model.dart';

@JsonSerializable()
class ProductInfoPage extends PageDataImpl<ProductInfo> {
  ProductInfoPage({required super.paginationInfo, required super.items});

  factory ProductInfoPage.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInfoPageToJson(this);
}
