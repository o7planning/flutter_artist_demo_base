part of '../model.dart';

/// <pre>
/// {
///   "data" : [ {
///     "dataName" : "Order",
///     "currentValue" : 133.0,
///     "previousValue" : 168.0,
///     "isMoney": false
///   }, {
///     "dataName" : "Customer",
///     "currentValue" : 133.0,
///     "previousValue" : 168.0,
///     "isMoney": false
///   }, {
///     "dataName" : "Amount",
///     "currentValue" : 144019.1,
///     "previousValue" : 170932.1,
///     "isMoney": true
///   }, {
///     "dataName" : "Tax Amount",
///     "currentValue" : 13156.6,
///     "previousValue" : 15398.4,
///     "isMoney": true
///   } ]
/// }
/// </pre>
///
@JsonSerializable()
class SalesOrderSummaryData {
  @JsonKey(name: 'data')
  late List<CurrentPreviousValue> data;

  SalesOrderSummaryData({required this.data});

  factory SalesOrderSummaryData.zero() {
    return SalesOrderSummaryData(
      data: [
        CurrentPreviousValue.zero("--"),
        CurrentPreviousValue.zero("--"),
        CurrentPreviousValue.zero("--"),
        CurrentPreviousValue.zero("--"),
      ],
    );
  }

  factory SalesOrderSummaryData.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderSummaryDataFromJson(json);

  Map<String, dynamic> toJson() => _$SalesOrderSummaryDataToJson(this);
}
