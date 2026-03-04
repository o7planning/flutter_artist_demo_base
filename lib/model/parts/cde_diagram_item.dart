part of '../model.dart';

@JsonSerializable()
class CdeDiagramItem {
  @JsonKey(name: 'itemId')
  String itemId;

  @JsonKey(name: "company")
  CompanyInfo? company;

  @JsonKey(name: "department")
  DepartmentInfo? department;

  @JsonKey(name: 'employee')
  EmployeeInfo? employee;

  @JsonKey(name: 'children', defaultValue: [])
  List<CdeDiagramItem> children = [];

  @JsonKey(includeFromJson: false)
  bool selected = false;

  @JsonKey(includeFromJson: false)
  bool expanded = true;

  @JsonKey(includeFromJson: false)
  bool get isCompany => company != null;

  @JsonKey(includeFromJson: false)
  bool get isDepartment => department != null;

  @JsonKey(includeFromJson: false)
  bool get isEmployee => employee != null;

  CdeDiagramItem(this.itemId);

  CdeDiagramItem? findSelectedItem() {
    if (selected) {
      return this;
    }
    for (var child in children) {
      CdeDiagramItem? found = child.findSelectedItem();
      if (found != null) {
        return found;
      }
    }
    return null;
  }

  void deselectCascade() {
    selected = false;
    for (var child in children) {
      child.deselectCascade();
    }
  }

  factory CdeDiagramItem.fromJson(Map<String, dynamic> json) =>
      _$CdeDiagramItemFromJson(json);

  Map<String, dynamic> toJson() => _$CdeDiagramItemToJson(this);

  @override
  String toString() {
    if (company != null) {
      return company!.name;
    } else if (department != null) {
      return department!.name;
    } else if (employee != null) {
      return employee!.name;
    } else {
      return "null ?? ";
    }
  }
}
