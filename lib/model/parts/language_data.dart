part of '../model.dart';

@JsonSerializable()
class LanguageData implements Identifiable<String> {
  @override
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'nameInEnglish')
  String nameInEnglish;

  @JsonKey(name: 'seqNum')
  int seqNum;

  LanguageData(this.id, this.name, this.nameInEnglish, this.seqNum);

  LanguageData.named({
    required this.id,
    required this.name,
    required this.nameInEnglish,
    required this.seqNum,
  });

  LanguageInfo toLanguageInfo() {
    return LanguageInfo.named(
      id: id,
      name: name,
      nameInEnglish: nameInEnglish,
      seqNum: seqNum,
    );
  }

  factory LanguageData.fromJson(Map<String, dynamic> json) =>
      _$LanguageDataFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageDataToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
