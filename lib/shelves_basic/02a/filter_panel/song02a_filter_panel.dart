import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';

import '../../../model/model.dart';
import '../../../widgets/custom_app_container.dart';
import '../filter_model/song02a_filter_model.dart';

class Song02aFilterPanel extends FilterPanel<Song02aFilterModel> {
  const Song02aFilterPanel({super.key, required super.filterModel});

  @override
  Widget buildContent(BuildContext context) {
    return CustomAppContainer(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          buildFilterBar(context),
          SizedBox(height: 5),
          FaFormBuilderTextField.topLabel(
            name: "searchText~",
            labelText: "Search Text",
            maxLines: 1,
            onChanged: (_) {
              _querySong02a();
            },
          ),
          SizedBox(height: 5),
          FaFormBuilderDeselectableDropdown<AlbumInfo>.topLabel(
            name: "album~",
            labelText: "Album",
            items: filterModel.getMultiOptTildeCriterionData("album~") ?? [],
            getItemText: (item) => item.name,
            onChanged: (_) {
              _querySong02a();
            },
          ),
          SizedBox(height: 5),
          TextButton(onPressed: _querySong02a, child: Text("Search")),
        ],
      ),
    );
  }

  Future<void> _querySong02a() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    // Query all blocks and scalars associated with this filterModel.
    await filterModel.queryAll();
  }
}
