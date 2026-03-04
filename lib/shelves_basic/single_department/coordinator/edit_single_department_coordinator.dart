import 'package:flutter/cupertino.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../block/single_department_block.dart';
import '../filter_input/single_department_filter_input.dart';
import '../shelf/single_department_shelf.dart';

class EditSingleDepartmentCoordinator extends Coordinator {
  int departmentId;
  bool removeManagerFromDepartment;

  EditSingleDepartmentCoordinator({
    required super.config,
    required this.departmentId,
    this.removeManagerFromDepartment = false,
    required super.customNavigate,
  });

  @override
  Future<bool> performSetupOperation() async {
    SingleDepartmentShelf shelf = FlutterArtist.storage.findShelf();
    SingleDepartmentBlock block = shelf.findSingleDepartmentBlock();
    //
    BlockQueryResult result = await block.query(
      filterInput: SingleDepartmentFilterInput(departmentId: departmentId),
      afterQueryAction: AfterQueryAction.setAnItemAsCurrentThenLoadForm,
    );
    return result.successForAll;
  }

  @override
  Future<void> defaultNavigate(BuildContext context, bool success) async {
    // Do nothing.
  }
}
