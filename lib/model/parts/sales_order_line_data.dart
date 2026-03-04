part of '../model.dart';

@JsonSerializable()
class SalesOrderLineData implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'salesOrderId')
  late int salesOrderId;

  @JsonKey(name: 'product')
  ProductInfo product;

  @JsonKey(name: 'units')
  double units;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'amount')
  double amount;

  @JsonKey(name: 'taxAmount')
  double taxAmount;

  SalesOrderLineData(
    this.id,
    this.salesOrderId,
    this.product,
    this.units,
    this.price,
    this.amount,
    this.taxAmount,
  );

  factory SalesOrderLineData.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderLineDataFromJson(json);

  SalesOrderLineInfo toSalesOrderLineInfo() {
    return SalesOrderLineInfo.named(
      id: id,
      salesOrderId: salesOrderId,
      product: product,
      units: units,
      price: price,
      amount: amount,
    );
  }

  Map<String, dynamic> toJson() => _$SalesOrderLineDataToJson(this);
}
