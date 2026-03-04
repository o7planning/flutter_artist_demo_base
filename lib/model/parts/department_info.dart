part of '../model.dart';

@JsonSerializable()
class DepartmentInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'code')
  late String code;

  @JsonKey(name: 'name')
  late String name;

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

  DepartmentInfo(this.id, this.code, this.name, this.companyId);

  DepartmentInfo.named({
    required this.id,
    required this.code,
    required this.name,
    required this.companyId,
    required this.imagePath,
    required this.manager,
  });

  factory DepartmentInfo.fromJson(Map<String, dynamic> json) =>
      _$DepartmentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
