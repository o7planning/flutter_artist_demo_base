part of '../model.dart';

@JsonSerializable()
class CustomerData implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'code')
  late String code;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'vip')
  late bool vip;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  @JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'email')
  String? email;

  CustomerData(
    this.id,
    this.code,
    this.name,
    this.vip,
    this.imagePath,
    this.address,
    this.email,
    this.phone,
  );

  CustomerInfo toCustomerInfo() {
    return CustomerInfo.named(
      id: id,
      code: code,
      name: name,
      vip: vip,
      imagePath: imagePath,
    );
  }

  factory CustomerData.fromJson(Map<String, dynamic> json) =>
      _$CustomerDataFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
