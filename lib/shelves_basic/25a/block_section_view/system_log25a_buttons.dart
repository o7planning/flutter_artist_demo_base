import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../action/system_log25a_quick_multi_item_creation_action.dart';
import '../block/system_log25a_block.dart';

class SystemLog25aButtons extends BlockSectionView<SystemLog25aBlock> {
  const SystemLog25aButtons({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Quick Create Multi Items without Confirmation"),
        const SizedBox(height: 10),
        ElevatedButton(
          key: const Key("createMultiSystemLogBtn"),
          onPressed: _systemLog25aCreateMultiSystemLogs,
          child: const Text("Quick Create Multi Items (1)"),
        ),
        Divider(height: 40),
        Text("Quick Create Multi Items with Default Confirmation"),
        const SizedBox(height: 10),
        ElevatedButton(
          key: const Key("createMultiSystemLogBtn2"),
          onPressed: _systemLog25aCreateMultiSystemLogs2,
          child: const Text("Quick Create Multi Items (2)"),
        ),
        Divider(height: 40),
        Text("Quick Create Multi Items with Custom Confirmation"),
        const SizedBox(height: 10),
        ElevatedButton(
          key: const Key("createMultiSystemLogBtn3"),
          onPressed: _systemLog25aCreateMultiSystemLogs3,
          child: const Text("Quick Create Multi Items (3)"),
        ),
      ],
    );
  }

  Future<void> _systemLog25aCreateMultiSystemLogs() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    var action = SystemLog25aQuickMultiItemCreationAction(
      needToConfirm: false,
      customConfirmation: false,
      actionInfo: 'Create Multi SystemLogs',
    );
    await block.executeQuickMultiItemCreationAction(action: action);
  }

  Future<void> _systemLog25aCreateMultiSystemLogs2() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    var action = SystemLog25aQuickMultiItemCreationAction(
      needToConfirm: true,
      customConfirmation: false,
      actionInfo: 'Create Multi SystemLogs',
    );
    await block.executeQuickMultiItemCreationAction(action: action);
  }

  Future<void> _systemLog25aCreateMultiSystemLogs3() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    var action = SystemLog25aQuickMultiItemCreationAction(
      needToConfirm: true,
      customConfirmation: true,
      actionInfo: 'Create Multi SystemLogs',
    );
    await block.executeQuickMultiItemCreationAction(action: action);
  }
}
