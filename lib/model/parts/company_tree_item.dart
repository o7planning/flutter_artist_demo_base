part of '../model.dart';

@JsonSerializable()
class CompanyTreeItem implements Identifiable<int> {
  @override
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'children', defaultValue: [])
  List<CompanyTreeItem> children = [];

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  @JsonKey(includeFromJson: false)
  bool isVirtual = false;

  CompanyTreeItem(this.id, this.name);

  CompanyTreeItem.named({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  CompanyTreeItem.virtual(this.id, this.name) : isVirtual = true;

  CompanyTreeItem? findItemByIdCascade(int treeItemId) {
    if (id == treeItemId) {
      return this;
    }
    for (CompanyTreeItem child in children) {
      CompanyTreeItem? found = child.findItemByIdCascade(treeItemId);
      if (found != null) {
        return found;
      }
    }
    return null;
  }

  factory CompanyTreeItem.fromJson(Map<String, dynamic> json) =>
      _$CompanyTreeItemFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyTreeItemToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
