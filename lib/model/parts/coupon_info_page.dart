part of '../model.dart';

@JsonSerializable()
class CouponInfoPage extends PageDataImpl<CouponInfo> {
  CouponInfoPage({required super.items, required super.paginationInfo});

  factory CouponInfoPage.fromJson(Map<String, dynamic> json) =>
      _$CouponInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$CouponInfoPageToJson(this);
}
