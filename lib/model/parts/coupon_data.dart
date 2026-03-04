part of '../model.dart';

@JsonSerializable()
class CouponData extends CouponInfo {
  @JsonKey(name: 'description')
  String? description;

  CouponData(
    super.id,
    super.code,
    super.name,
    super.active,
    super.type,
    super.expiryDate,
    super.imagePath,
  );

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
