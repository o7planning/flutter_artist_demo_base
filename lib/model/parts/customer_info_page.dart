part of '../model.dart';

@JsonSerializable()
class CustomerInfoPage extends PageDataImpl<CustomerInfo> {
  CustomerInfoPage({required super.items, required super.paginationInfo});

  factory CustomerInfoPage.fromJson(Map<String, dynamic> json) =>
      _$CustomerInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerInfoPageToJson(this);
}
