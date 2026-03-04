part of '../model.dart';

@JsonSerializable()
class CompanyTree {
  @JsonKey(name: 'rootCompanyTreeItems', defaultValue: [])
  List<CompanyTreeItem> rootCompanyTreeItems = [];

  @JsonKey(includeFromJson: false)
  CompanyTreeItem? _virtualRootTreeItem;

  @JsonKey(includeFromJson: false)
  CompanyTreeItem get virtualRootTreeItem {
    if (_virtualRootTreeItem == null) {
      _virtualRootTreeItem = CompanyTreeItem.virtual(-1, "Select a Company");
      _virtualRootTreeItem!.children = rootCompanyTreeItems;
    }
    return _virtualRootTreeItem!;
  }

  CompanyTree();

  void addNotFoundCompany(CompanyTreeItem item) {
    var internalItem = rootCompanyTreeItems.firstWhereOrNull(
      (it) => it.id == item.id,
    );
    if (internalItem == null) {
      rootCompanyTreeItems.add(item);
    }
  }

  void removeNotFoundCompany(CompanyTreeItem item) {
    rootCompanyTreeItems.removeWhere((it) => it.id == item.id);
  }

  CompanyTreeItem? findTreeItemById(int treeItemId) {
    for (CompanyTreeItem treeItem in rootCompanyTreeItems) {
      CompanyTreeItem? found = treeItem.findItemByIdCascade(treeItemId);
      if (found != null) {
        return found;
      }
    }
    return null;
  }

  CompanyTreeItem? specifyDefaultSelectedTreeItem({
    required CompanyTreeItem? suggestedItem,
  }) {
    if (suggestedItem != null) {
      CompanyTreeItem? found = findTreeItemById(suggestedItem.id);
      if (found != null) {
        return found;
      }
    }
    return rootCompanyTreeItems.firstOrNull;
  }

  factory CompanyTree.fromJson(Map<String, dynamic> json) =>
      _$CompanyTreeFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyTreeToJson(this);
}
