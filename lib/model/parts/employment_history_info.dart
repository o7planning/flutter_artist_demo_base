part of '../model.dart';

@JsonSerializable()
class EmploymentHistoryInfo implements Identifiable<int> {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'employee')
  late EmployeeInfo employee;

  @JsonKey(
    name: 'fromDate',
    fromJson: __stringToDateTime,
    toJson: __dateTimeToString,
  )
  late DateTime fromDate;

  @JsonKey(
    name: 'toDate',
    fromJson: __stringToNullableDateTime,
    toJson: __dateTimeToNullableString,
  )
  DateTime? toDate;

  @JsonKey(name: 'employeePosition')
  late EmployeePositionInfo employeePosition;

  EmploymentHistoryInfo(
    this.id,
    this.employee,
    this.fromDate,
    this.employeePosition,
  );

  EmploymentHistoryInfo.named({
    required this.id,
    required this.employee,
    required this.fromDate,
    required this.toDate,
    required this.employeePosition,
  });

  factory EmploymentHistoryInfo.fromJson(Map<String, dynamic> json) =>
      _$EmploymentHistoryInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EmploymentHistoryInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id)";
  }
}
