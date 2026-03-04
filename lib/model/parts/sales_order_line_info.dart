part of '../model.dart';

@JsonSerializable()
class SalesOrderLineInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'salesOrderId')
  int salesOrderId;

  @JsonKey(name: 'product')
  ProductInfo product;

  @JsonKey(name: 'units')
  double units;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'amount')
  double amount;

  SalesOrderLineInfo(
    this.id,
    this.salesOrderId,
    this.product,
    this.units,
    this.price,
    this.amount,
  );

  SalesOrderLineInfo.named({
    required this.id,
    required this.salesOrderId,
    required this.product,
    required this.units,
    required this.price,
    required this.amount,
  });

  factory SalesOrderLineInfo.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderLineInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SalesOrderLineInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, ${product.name})";
  }
}
