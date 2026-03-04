part of '../model.dart';

@JsonSerializable()
class CompanyData implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'code')
  late String code;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'companyIdParent')
  int? companyIdParent;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  CompanyData(this.id, this.code, this.name);

  CompanyInfo toCompanyInfo() {
    return CompanyInfo.named(
      id: id,
      code: code,
      name: name,
      companyIdParent: companyIdParent,
      imagePath: imagePath,
    );
  }

  factory CompanyData.fromJson(Map<String, dynamic> json) =>
      _$CompanyDataFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
