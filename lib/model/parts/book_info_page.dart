part of '../model.dart';

@JsonSerializable()
class BookInfoPage extends PageDataImpl<BookInfo> {
  BookInfoPage({required super.items, required super.paginationInfo});

  factory BookInfoPage.fromJson(Map<String, dynamic> json) =>
      _$BookInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$BookInfoPageToJson(this);
}
