part of '../model.dart';

@JsonSerializable()
class SupplierInfoPage extends PageDataImpl<SupplierInfo> {
  SupplierInfoPage({required super.items, required super.paginationInfo});

  factory SupplierInfoPage.fromJson(Map<String, dynamic> json) =>
      _$SupplierInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierInfoPageToJson(this);
}
