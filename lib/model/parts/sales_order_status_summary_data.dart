part of '../model.dart';

@JsonSerializable()
class SalesOrderStatusSummaryData {
  @JsonKey(name: 'salesOrderCount')
  int salesOrderCount = 0;
  @JsonKey(name: 'pendingCount')
  int pendingCount = 0;
  @JsonKey(name: 'processingCount')
  int processingCount = 0;
  @JsonKey(name: 'deliveriedCount')
  int deliveriedCount = 0;

  SalesOrderStatusSummaryData({
    required this.salesOrderCount,
    required this.pendingCount,
    required this.processingCount,
    required this.deliveriedCount,
  });

  factory SalesOrderStatusSummaryData.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderStatusSummaryDataFromJson(json);

  Map<String, dynamic> toJson() => _$SalesOrderStatusSummaryDataToJson(this);
}
