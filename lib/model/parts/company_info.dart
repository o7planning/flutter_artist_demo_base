part of '../model.dart';

@JsonSerializable()
class CompanyInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'code')
  late String code;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'companyIdParent')
  int? companyIdParent;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  CompanyInfo(this.id, this.code, this.name);

  CompanyInfo.named({
    required this.id,
    required this.code,
    required this.name,
    required this.companyIdParent,
    required this.imagePath,
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
