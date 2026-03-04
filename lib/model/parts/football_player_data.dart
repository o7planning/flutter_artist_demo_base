part of '../model.dart';

@JsonSerializable()
class FootballPlayerData extends FootballPlayerInfo {
  @JsonKey(name: 'description')
  String? description;

  FootballPlayerData(
    super.id,
    super.fullName,
    super.birthday,
    super.country,
    super.imagePath,
  );

  factory FootballPlayerData.fromJson(Map<String, dynamic> json) =>
      _$FootballPlayerDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FootballPlayerDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $fullName)";
  }
}
