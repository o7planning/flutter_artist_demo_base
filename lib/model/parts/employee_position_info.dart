part of '../model.dart';

@JsonSerializable()
class EmployeePositionInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'code')
  late String code;

  @JsonKey(name: 'name')
  late String name;

  EmployeePositionInfo(this.id, this.code, this.name);

  EmployeePositionInfo.named({
    required this.id,
    required this.code,
    required this.name,
  });

  factory EmployeePositionInfo.fromJson(Map<String, dynamic> json) =>
      _$EmployeePositionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeePositionInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
