part of '../model.dart';

@JsonSerializable()
class SalesOrderInfoPage extends PageDataImpl<SalesOrderInfo> {
  SalesOrderInfoPage({required super.paginationInfo, required super.items});

  factory SalesOrderInfoPage.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$SalesOrderInfoPageToJson(this);
}
