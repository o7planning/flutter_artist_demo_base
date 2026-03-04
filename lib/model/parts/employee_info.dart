part of '../model.dart';

@JsonSerializable()
class EmployeeInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'empNumber')
  late String empNumber;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'employeePosition')
  EmployeePositionInfo employeePosition;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  EmployeeInfo(this.id, this.empNumber, this.name, this.employeePosition);

  factory EmployeeInfo.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
