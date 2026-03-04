part of '../model.dart';

@JsonSerializable()
class DepartmentData implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'code')
  late String code;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'companyId')
  int companyId;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(name: 'manager')
  EmployeeInfo? manager;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  DepartmentData(this.id, this.code, this.name, this.companyId);

  DepartmentInfo toDepartmentInfo() {
    return DepartmentInfo.named(
      id: id,
      code: code,
      name: name,
      imagePath: imagePath,
      companyId: companyId,
      manager: manager,
    );
  }

  factory DepartmentData.fromJson(Map<String, dynamic> json) =>
      _$DepartmentDataFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
