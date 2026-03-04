part of '../model.dart';

@JsonSerializable()
class SalesOrderInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  int id;

  @JsonKey(
    name: 'orderDateTime',
    fromJson: __stringToDateTime,
    toJson: __dateTimeToString,
  )
  DateTime orderDateTime;

  @JsonKey(name: 'amount')
  double amount;

  @JsonKey(name: 'taxAmount')
  double taxAmount;

  @JsonKey(name: 'status')
  String status;

  SalesOrderInfo(
    this.id,
    this.orderDateTime,
    this.amount,
    this.taxAmount,
    this.status,
  );

  SalesOrderInfo.named({
    required this.id,
    required this.orderDateTime,
    required this.amount,
    required this.taxAmount,
    required this.status,
  });

  factory SalesOrderInfo.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SalesOrderInfoToJson(this);
}
