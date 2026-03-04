part of '../model.dart';

@JsonSerializable()
class EmploymentHistoryData implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'employee')
  EmployeeInfo employee;

  @JsonKey(name: "department")
  DepartmentInfo department;

  @JsonKey(name: "company")
  CompanyInfo company;

  @JsonKey(name: 'employeePosition')
  EmployeePositionInfo employeePosition;

  @JsonKey(
    name: 'fromDate',
    fromJson: __stringToDateTime,
    toJson: __dateTimeToString,
  )
  DateTime fromDate;

  @JsonKey(
    name: 'toDate',
    fromJson: __stringToNullableDateTime,
    toJson: __dateTimeToNullableString,
  )
  DateTime? toDate;

  EmploymentHistoryData(
    this.id,
    this.employee,
    this.department,
    this.company,
    this.employeePosition,
    this.fromDate,
  );

  EmploymentHistoryInfo toEmploymentHistoryInfo() {
    return EmploymentHistoryInfo.named(
      id: id,
      employee: employee,
      fromDate: fromDate,
      toDate: toDate,
      employeePosition: employeePosition,
    );
  }

  factory EmploymentHistoryData.fromJson(Map<String, dynamic> json) =>
      _$EmploymentHistoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmploymentHistoryDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id)";
  }
}
