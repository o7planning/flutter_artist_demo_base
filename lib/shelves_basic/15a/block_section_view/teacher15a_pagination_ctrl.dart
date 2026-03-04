import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../block/teacher15a_block.dart';

class Teacher15aPaginationCtrl extends BlockSectionView<Teacher15aBlock> {
  const Teacher15aPaginationCtrl({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    return Wrap(
      runSpacing: 5,
      children: [
        Tooltip(
          message:
              "Query the next page and append to the current list of items.",
          child: TextButton(onPressed: _loadMore, child: Text("Load more..")),
        ),
        Tooltip(
          message:
              "Query the first page and replace the current items in the list.",
          child: TextButton(
            onPressed: _clearAndReQuery,
            child: Text("Clear and Re-Query"),
          ),
        ),
        Tooltip(
          message:
              "Query the previous page and replace the current items in the list.",
          child: TextButton(
            onPressed: _queryPrevious,
            child: Text("<< Query Previous"),
          ),
        ),
        Tooltip(
          message:
              "Query the next page and replace the current items in the list.",
          child: TextButton(
            onPressed: _queryNext,
            child: Text("Query Next >>"),
          ),
        ),
      ],
    );
  }

  Future<void> _queryPrevious() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    // Query the previous page and replace the current items in the list.
    //
    await block.queryPreviousPage();
  }

  Future<void> _queryNext() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    // Query the next page and replace the current items in the list.
    //
    await block.queryNextPage();
  }

  Future<void> _loadMore() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    // Query next page and append to current list of items.
    //
    await block.queryMore();
  }

  Future<void> _clearAndReQuery() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    // Query the first page and replace all items in the list.
    //
    await block.query();
  }
}
