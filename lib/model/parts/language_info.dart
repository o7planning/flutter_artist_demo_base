part of '../model.dart';

@JsonSerializable()
class LanguageInfo implements Identifiable<String> {
  @override
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'nameInEnglish')
  String nameInEnglish;

  @JsonKey(name: 'seqNum')
  int seqNum;

  LanguageInfo(this.id, this.name, this.nameInEnglish, this.seqNum);

  LanguageInfo.named({
    required this.id,
    required this.name,
    required this.nameInEnglish,
    required this.seqNum,
  });

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
