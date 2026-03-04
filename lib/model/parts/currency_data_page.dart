part of '../model.dart';

@JsonSerializable()
class CurrencyDataPage extends PageDataImpl<CurrencyData> {
  CurrencyDataPage({required super.items, required super.paginationInfo});

  factory CurrencyDataPage.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDataPageFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyDataPageToJson(this);
}
