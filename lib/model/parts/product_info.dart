part of '../model.dart';

@JsonSerializable()
class ProductInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'price')
  late double price;

  @JsonKey(name: 'active')
  late bool active;

  @JsonKey(name: 'categoryId')
  late int categoryId;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  ProductInfo(
    this.id,
    this.name,
    this.price,
    this.active,
    this.categoryId,
    this.imagePath,
  );

  ProductInfo.named({
    required this.id,
    required this.name,
    required this.price,
    required this.active,
    required this.categoryId,
    required this.imagePath,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
