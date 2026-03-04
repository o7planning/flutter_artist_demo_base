part of '../model.dart';

@JsonSerializable()
class ProductData implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'price')
  late double price;

  @JsonKey(name: 'active')
  late bool active;

  @JsonKey(name: 'category')
  CategoryInfo category;

  @JsonKey(name: 'estimatedInputPrice')
  late double estimatedInputPrice;

  @JsonKey(name: 'taxRate')
  late double taxRate;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  ProductData(
    this.id,
    this.name,
    this.category,
    this.price,
    this.active,
    this.imagePath,
    this.estimatedInputPrice,
    this.taxRate,
  );

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);

  ProductInfo toProductInfo() {
    return ProductInfo.named(
      id: id,
      name: name,
      price: price,
      active: active,
      categoryId: category.id,
      imagePath: imagePath,
    );
  }

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
