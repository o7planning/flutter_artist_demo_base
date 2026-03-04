part of '../model.dart';

@JsonSerializable()
class PaymentGatewayInfo implements Identifiable<String> {
  @override
  @JsonKey(name: 'id')
  late String id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'active')
  late bool active;

  PaymentGatewayInfo({
    required this.id,
    required this.name,
    required this.active,
  });

  PaymentGatewayInfo.empty() : id = '', name = '', active = false;

  factory PaymentGatewayInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentGatewayInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentGatewayInfoToJson(this);
}
