part of '../model.dart';

@JsonSerializable()
class GenderInfo implements Identifiable<String> {
  @override
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  GenderInfo(this.id, this.name);

  GenderInfo.named({required this.id, required this.name});

  factory GenderInfo.fromJson(Map<String, dynamic> json) =>
      _$GenderInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GenderInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
