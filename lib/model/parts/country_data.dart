part of '../model.dart';

@JsonSerializable()
class CountryData implements Identifiable<String> {
  @override
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'nameInEnglish')
  String nameInEnglish;

  @JsonKey(name: 'countryCode')
  String countryCode;

  @JsonKey(name: 'isoCode2')
  String isoCode2;

  @JsonKey(name: 'isoCode3')
  String isoCode3;

  @JsonKey(name: 'population')
  int population;

  @JsonKey(name: 'area')
  int area;

  @JsonKey(name: 'gdp')
  double? gdp;

  @JsonKey(name: 'description')
  String? description;

  String get imageUrl {
    return "https://flagcdn.com/108x81/${isoCode2.toLowerCase()}.png";
  }

  CountryData(
    this.id,
    this.name,
    this.nameInEnglish,
    this.countryCode,
    this.isoCode2,
    this.isoCode3,
    this.population,
    this.area,
  );

  CountryData.named({
    required this.id,
    required this.name,
    required this.nameInEnglish,
    required this.countryCode,
    required this.isoCode2,
    required this.isoCode3,
    required this.population,
    required this.area,
    this.gdp,
  });

  CountryInfo toCountryInfo() {
    return CountryInfo.named(
      id: id,
      name: name,
      nameInEnglish: nameInEnglish,
      countryCode: countryCode,
      isoCode2: isoCode2,
      isoCode3: isoCode3,
      population: population,
      area: area,
      gdp: gdp,
    );
  }

  factory CountryData.fromJson(Map<String, dynamic> json) =>
      _$CountryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
