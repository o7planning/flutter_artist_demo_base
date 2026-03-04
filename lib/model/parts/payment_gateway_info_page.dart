part of '../model.dart';

@JsonSerializable()
class PaymentGatewayInfoPage extends PageDataImpl<PaymentGatewayInfo> {
  PaymentGatewayInfoPage({required super.paginationInfo, required super.items});

  factory PaymentGatewayInfoPage.fromJson(Map<String, dynamic> json) =>
      _$PaymentGatewayInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentGatewayInfoPageToJson(this);
}
