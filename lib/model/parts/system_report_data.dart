part of '../model.dart';

@JsonSerializable()
class SystemReportData {
  @JsonKey(name: "employeeCount")
  int employeeCount;

  @JsonKey(name: "supplierCount")
  int supplierCount;

  @JsonKey(name: "categoryCount")
  int categoryCount;

  @JsonKey(name: "productCount")
  int productCount;

  @JsonKey(name: "saleOrderCount")
  int saleOrderCount;

  @JsonKey(name: "noteCount")
  int noteCount;

  SystemReportData(
    this.employeeCount,
    this.supplierCount,
    this.categoryCount,
    this.productCount,
    this.saleOrderCount,
    this.noteCount,
  );

  factory SystemReportData.fromJson(Map<String, dynamic> json) =>
      _$SystemReportDataFromJson(json);

  Map<String, dynamic> toJson() => _$SystemReportDataToJson(this);
}
