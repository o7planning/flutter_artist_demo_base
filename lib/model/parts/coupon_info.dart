part of '../model.dart';

@JsonSerializable()
class CouponInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'code')
  late String code;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'active')
  late bool active;

  @JsonKey(name: 'type')
  late String type;

  @JsonKey(
    name: 'expiryDate',
    fromJson: __stringToDateTime,
    toJson: __dateTimeToString,
  )
  late DateTime expiryDate;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  CouponInfo(
    this.id,
    this.code,
    this.name,
    this.active,
    this.type,
    this.expiryDate,
    this.imagePath,
  );

  CouponInfo.named({
    required this.id,
    required this.code,
    required this.name,
    required this.type,
    required this.active,
    required this.expiryDate,
  });

  CouponInfo.empty()
    : id = -1,
      code = '',
      name = '',
      active = false,
      expiryDate = DateTime.now();

  factory CouponInfo.fromJson(Map<String, dynamic> json) =>
      _$CouponInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CouponInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
