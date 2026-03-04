import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';

class SystemLog25aListItem extends StatelessWidget {
  final SystemLogInfo systemLogInfo;
  final bool selected;
  final Function(SystemLogInfo systemLogInfo) onSystemLogPressed;

  const SystemLog25aListItem({
    super.key,
    required this.systemLogInfo,
    required this.selected,
    required this.onSystemLogPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Colors.indigo.withAlpha(30) : null,
      child: ListTile(
        key: Key("systemLog-list-item-${systemLogInfo.id}"),
        title: Text(
          systemLogInfo.content,
          style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
        ),
        // subtitle: IconLabelText(
        //   icon: Icon(
        //     systemLogInfo.active
        //         ? Icons.check_box_outlined
        //         : Icons.check_box_outline_blank,
        //     size: 14,
        //   ),
        //   label: "",
        //   text: "Active?",
        //   textStyle: const TextStyle(fontSize: 11),
        // ),
        onTap: _onTap,
      ),
    );
  }

  void _onTap() {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    onSystemLogPressed(systemLogInfo);
  }
}
