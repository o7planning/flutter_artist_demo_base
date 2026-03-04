part of '../model.dart';

int _xxx = 0;

@JsonSerializable()
class SupplierTypeInfo implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'code')
  late String code;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(includeFromJson: false)
  int xxx = _xxx++;

  SupplierTypeInfo(this.id, this.code, this.name);

  SupplierTypeInfo.named({
    required this.id,
    required this.code,
    required this.name,
  });

  factory SupplierTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$SupplierTypeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierTypeInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name, $xxx)";
  }
}
