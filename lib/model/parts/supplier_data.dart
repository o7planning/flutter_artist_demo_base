part of '../model.dart';

@JsonSerializable()
class SupplierData implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'active')
  bool active;

  @JsonKey(name: 'email')
  late String email;

  @JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'supplierType')
  SupplierTypeInfo supplierType;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  SupplierData(this.id, this.name, this.active, this.email, this.supplierType);

  SupplierInfo toSupplierInfo() {
    return SupplierInfo.named(
      id: id,
      name: name,
      active: active,
      supplierType: supplierType,
      imagePath: imagePath,
    );
  }

  factory SupplierData.fromJson(Map<String, dynamic> json) =>
      _$SupplierDataFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
