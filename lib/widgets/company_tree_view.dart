import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:animated_tree_view/tree_view/tree_view.dart';
import 'package:animated_tree_view/tree_view/widgets/expansion_indicator.dart';
import 'package:animated_tree_view/tree_view/widgets/indent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';

import '../../../model/model.dart';
import '../../../widgets/image_url_view.dart';

class CompanyTreeView extends StatefulWidget {
  final CompanyTree? companyTree;
  final CompanyTreeItem? selectedCompanyTreeItem;
  final Function(CompanyTreeItem companyTreeItem) onSelectCompanyTreeItem;
  final EdgeInsets padding;

  const CompanyTreeView({
    super.key,
    required this.companyTree,
    this.padding = EdgeInsets.zero,
    required this.selectedCompanyTreeItem,
    required this.onSelectCompanyTreeItem,
  });

  @override
  State<StatefulWidget> createState() {
    return _CompanyTreeItemTreeViewState();
  }
}

class _CompanyTreeItemTreeViewState extends State<CompanyTreeView> {
  CompanyTreeItem? rootCompanyTreeItem;

  void addChildNode(
    CompanyTreeItem companyTreeItem,
    TreeNode<CompanyTreeItem> node,
  ) {
    for (CompanyTreeItem childCompanyTreeItem in companyTreeItem.children) {
      TreeNode<CompanyTreeItem> childNode = TreeNode(
        data: childCompanyTreeItem,
        key: "CompanyTreeItem-${childCompanyTreeItem.id}",
        parent: null,
      );
      node.children[childNode.key] = childNode;
      childNode.parent = node;
      addChildNode(childCompanyTreeItem, childNode);
    }
  }

  TreeNode<CompanyTreeItem>? _toRootTreeNode(
    CompanyTreeItem virtualRootTreeItem,
  ) {
    TreeNode<CompanyTreeItem> rootNode = TreeNode(
      data: virtualRootTreeItem,
      key: "CompanyTreeItem-${virtualRootTreeItem.id}",
      parent: null,
    );
    addChildNode(virtualRootTreeItem, rootNode);
    return rootNode;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.companyTree == null) {
      return Text("No Company Data");
    }
    TreeNode<CompanyTreeItem>? rootTreeNode = _toRootTreeNode(
      widget.companyTree!.virtualRootTreeItem,
    );

    //
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if (rootTreeNode == null) const LoadingContainer.simple(height: 120),
          if (rootTreeNode != null) Expanded(child: _buildTree(rootTreeNode)),
        ],
      ),
    );
  }

  Widget _buildTree(TreeNode<CompanyTreeItem> rootTreeNode) {
    return TreeView.simple(
      key: Key("CompanyTreeItem-Tree"),
      tree: rootTreeNode,
      showRootNode: true,
      expansionIndicatorBuilder: (context, node) {
        return ChevronIndicator.upDown(
          tree: node,
          color: Colors.grey[700],
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          icon: Icons.keyboard_arrow_down_outlined,
        );
      },
      indentation: const Indentation(
        style: IndentStyle.scopingLine,
        thickness: 0.5,
        width: 10,
      ),
      onItemTap: (item) {
        //
      },
      onTreeReady:
          (
            TreeViewController<CompanyTreeItem, TreeNode<CompanyTreeItem>>
            controller,
          ) {
            setState(() {
              // _treeViewController = controller;
            });
            controller.expandAllChildren(rootTreeNode);
          },
      builder: (context, node) {
        CompanyTreeItem companyTreeItem = node.data!;
        var companyTreeItemWidget = _buildCompanyTreeItemWidget(
          companyTreeItem: companyTreeItem,
          node: node,
        );
        if (node.level == 0) {
          return Card(
            key: Key("RootNode--${companyTreeItem.id}"),
            child: companyTreeItemWidget,
          );
        }
        return companyTreeItemWidget;
      },
    );
  }

  Widget _buildCompanyTreeItemWidget({
    required CompanyTreeItem companyTreeItem,
    required TreeNode node,
  }) {
    bool selected = companyTreeItem.id == widget.selectedCompanyTreeItem?.id;
    return ListTile(
      key: Key("CompanyTreeItem-${companyTreeItem.id}"),
      dense: true,
      selected: selected,
      visualDensity: const VisualDensity(horizontal: -2, vertical: -3),
      contentPadding: EdgeInsets.zero,
      title: IconLabelText(
        icon: companyTreeItem.isVirtual
            ? null
            : _companyTreeItemIcon(companyTreeItem),
        text: node.data!.name,
        label: '',
        textStyle: TextStyle(
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      onTap: companyTreeItem.isVirtual
          ? null
          : () {
              widget.onSelectCompanyTreeItem(companyTreeItem);
            },
    );
  }

  Widget _companyTreeItemIcon(CompanyTreeItem companyTreeItem) {
    return ImageUrlView(
      imageUrl: companyTreeItem.imageUrl,
      size: 24,
      boxShape: BoxShape.rectangle,
    );
  }
}
