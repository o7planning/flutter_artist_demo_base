part of '../model.dart';

@JsonSerializable()
class CountryInfoPage extends PageDataImpl<CountryInfo> {
  CountryInfoPage({required super.items, required super.paginationInfo});

  factory CountryInfoPage.fromJson(Map<String, dynamic> json) =>
      _$CountryInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$CountryInfoPageToJson(this);
}
