part of '../model.dart';

@JsonSerializable()
class EmployeeData extends EmployeeInfo {
  @JsonKey(name: 'email')
  late String email;

  // yyyy-MM-dd
  @JsonKey(
    name: 'birthday',
    fromJson: __stringToDateTime,
    toJson: __dateTimeToString,
  )
  late DateTime birthday;

  // yyyy-MM-dd
  @JsonKey(
    name: 'hireDate',
    fromJson: __stringToDateTime,
    toJson: __dateTimeToString,
  )
  DateTime hireDate;

  @JsonKey(name: 'address')
  String? address;

  EmployeeData(
    super.id,
    super.empNumber,
    super.name,
    super.employeePosition,
    this.email,
    this.birthday,
    this.hireDate,
    this.address,
  );

  factory EmployeeData.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
