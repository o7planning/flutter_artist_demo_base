part of '../model.dart';

@JsonSerializable()
class SalesOrderLineInfoPage extends PageDataImpl<SalesOrderLineInfo> {
  SalesOrderLineInfoPage({required super.items, required super.paginationInfo});

  factory SalesOrderLineInfoPage.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderLineInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$SalesOrderLineInfoPageToJson(this);
}
