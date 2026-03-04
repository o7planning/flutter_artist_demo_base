import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/rest_provider/system_log_rest_provider.dart';

import '../../../model/model.dart';
import '../dialog/system_log25a_confirm_dialog.dart';

class SystemLog25aQuickMultiItemCreationAction
    extends
        BlockQuickMultiItemCreationAction<
          int, //
          SystemLogInfo,
          SystemLogData,
          EmptyFilterCriteria
        > {
  final bool customConfirmation;

  final _systemLogRestProvider = SystemLogRestProvider();

  SystemLog25aQuickMultiItemCreationAction({
    required super.needToConfirm,
    required super.actionInfo,
    required this.customConfirmation,
  });

  @override
  Future<ApiResult<PageData<SystemLogInfo>>> performQuickCreateMultiItems({
    required Object? parentBlockItem,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return await _systemLogRestProvider.createMultiSystemLogs();
  }

  @override
  CustomConfirmation? createCustomConfirmation() {
    if (!customConfirmation) {
      return null;
    }
    return (BuildContext context) async {
      bool confirm =
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return SystemLog25aConfirmDialog();
            },
          ) ??
          false;
      return confirm;
    };
  }
}
