part of '../model.dart';

@JsonSerializable()
class PaymentGatewayData extends PaymentGatewayInfo {
  PaymentGatewayData({
    required super.id,
    required super.name,
    required super.active,
  });

  factory PaymentGatewayData.fromJson(Map<String, dynamic> json) =>
      _$PaymentGatewayDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentGatewayDataToJson(this);
}
