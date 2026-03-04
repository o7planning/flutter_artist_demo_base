part of '../model.dart';

@JsonSerializable()
class FootballPlayerInfoPage extends PageDataImpl<FootballPlayerInfo> {
  FootballPlayerInfoPage({required super.items, required super.paginationInfo});

  factory FootballPlayerInfoPage.fromJson(Map<String, dynamic> json) =>
      _$FootballPlayerInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$FootballPlayerInfoPageToJson(this);
}
