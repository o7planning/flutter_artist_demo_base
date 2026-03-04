part of '../model.dart';

@JsonSerializable()
class SongInfoPage extends PageDataImpl<SongInfo> {
  SongInfoPage({required super.items, required super.paginationInfo});

  factory SongInfoPage.fromJson(Map<String, dynamic> json) =>
      _$SongInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$SongInfoPageToJson(this);
}
