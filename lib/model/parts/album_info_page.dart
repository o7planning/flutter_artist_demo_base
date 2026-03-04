part of '../model.dart';

@JsonSerializable()
class AlbumInfoPage extends PageDataImpl<AlbumInfo> {
  AlbumInfoPage({required super.items, required super.paginationInfo});

  factory AlbumInfoPage.fromJson(Map<String, dynamic> json) =>
      _$AlbumInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumInfoPageToJson(this);
}
