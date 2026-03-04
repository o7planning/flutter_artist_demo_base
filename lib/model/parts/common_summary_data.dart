part of '../model.dart';

@JsonSerializable()
class CommonSummaryData {
  @JsonKey(name: 'totalProduct')
  int totalProduct = 0;
  @JsonKey(name: 'totalCustomer')
  int totalCustomer = 0;

  CommonSummaryData(this.totalProduct, this.totalCustomer);

  CommonSummaryData.named({
    required this.totalProduct,
    required this.totalCustomer,
  });

  factory CommonSummaryData.zero() {
    return CommonSummaryData.named(totalProduct: 0, totalCustomer: 0);
  }

  factory CommonSummaryData.fromJson(Map<String, dynamic> json) =>
      _$CommonSummaryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CommonSummaryDataToJson(this);
}
