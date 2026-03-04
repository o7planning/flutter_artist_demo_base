part of '../model.dart';

@JsonSerializable()
class BestSellingData implements Identifiable<int> {
  @override
  @JsonKey(includeFromJson: false)
  int get id => productId;

  @JsonKey(name: 'categoryId')
  late int categoryId;

  @JsonKey(name: 'categoryName')
  late String categoryName;

  @JsonKey(name: 'productId')
  late int productId;

  @JsonKey(name: 'productName')
  late String productName;

  @JsonKey(name: 'productImageName')
  String? productImageName;

  @JsonKey(name: 'unitsTotal')
  late double unitsTotal;

  @JsonKey(name: 'amountTotal')
  late double amountTotal;

  @JsonKey(name: 'taxAmountTotal')
  late double taxAmountTotal;

  @JsonKey(includeFromJson: false)
  String? get productImageUrl {
    if (productImageName == null) {
      return null;
    }
    String imagePath = "/static/images/product/$productImageName";
    return getStaticResourceURL(imagePath);
  }

  BestSellingData(
    this.categoryId,
    this.categoryName,
    this.productId,
    this.productName,
    this.productImageName,
    this.unitsTotal,
    this.amountTotal,
    this.taxAmountTotal,
  );

  factory BestSellingData.fromJson(Map<String, dynamic> json) =>
      _$BestSellingDataFromJson(json);

  // IMPORTANT:
  Map<String, dynamic> toJson() => _$BestSellingDataToJson(this);
}
