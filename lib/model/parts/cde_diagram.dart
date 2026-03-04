part of '../model.dart';

@JsonSerializable()
class CdeDiagram {
  @JsonKey(name: 'rootItems', defaultValue: [])
  List<CdeDiagramItem> cdeDiagramItems = [];

  @JsonKey(includeFromJson: false)
  CdeDiagramItem? _rootCdeDiagramItem;

  @JsonKey(includeFromJson: false)
  CdeDiagramItem get rootCdeDiagramItem => _rootCdeDiagramItem!;

  @JsonKey(includeFromJson: false)
  String get keyString => "Key-$cdeDiagramItems";

  CdeDiagram(this.cdeDiagramItems) {
    // The "graphview" library only accepts one root item.
    if (cdeDiagramItems.length == 1) {
      _rootCdeDiagramItem = cdeDiagramItems.first;
    } else {
      _rootCdeDiagramItem = CdeDiagramItem("virtualRootItem");
      _rootCdeDiagramItem!.children = cdeDiagramItems;
    }
  }

  CdeDiagramItem? findSelectedItem() {
    for (var item in cdeDiagramItems) {
      CdeDiagramItem? selected = item.findSelectedItem();
      if (selected != null) {
        return selected;
      }
    }
    return null;
  }

  void deselectAllItems() {
    for (var item in cdeDiagramItems) {
      item.deselectCascade();
    }
  }

  factory CdeDiagram.fromJson(Map<String, dynamic> json) =>
      _$CdeDiagramFromJson(json);

  Map<String, dynamic> toJson() => _$CdeDiagramToJson(this);
}
