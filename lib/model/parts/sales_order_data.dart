part of '../model.dart';

@JsonSerializable()
class SalesOrderData extends SalesOrderInfo {
  @JsonKey(name: 'seller')
  EmployeeData? seller;

  @JsonKey(name: 'customer')
  CustomerInfo? customer;

  SalesOrderData(
    super.id,
    super.orderDateTime,
    super.amount,
    super.taxAmount,
    super.status,
  );

  factory SalesOrderData.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SalesOrderDataToJson(this);
}
