part of '../model.dart';

@JsonSerializable()
class SupplierTypeInfoPage extends PageDataImpl<SupplierTypeInfo> {
  SupplierTypeInfoPage({required super.items, required super.paginationInfo});

  factory SupplierTypeInfoPage.fromJson(Map<String, dynamic> json) =>
      _$SupplierTypeInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierTypeInfoPageToJson(this);
}
