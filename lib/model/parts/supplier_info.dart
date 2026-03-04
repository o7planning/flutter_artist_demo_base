part of '../model.dart';

@JsonSerializable()
class SupplierInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'active')
  bool active;

  @JsonKey(name: 'supplierType')
  SupplierTypeInfo supplierType;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  SupplierInfo(this.id, this.name, this.active, this.supplierType);

  SupplierInfo.named({
    required this.id,
    required this.name,
    required this.active,
    required this.supplierType,
    required this.imagePath,
  });

  factory SupplierInfo.fromJson(Map<String, dynamic> json) =>
      _$SupplierInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
