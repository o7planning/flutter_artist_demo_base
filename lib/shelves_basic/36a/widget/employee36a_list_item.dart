import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';

class Employee36aListItem extends StatelessWidget {
  final EmployeeInfo employeeInfo;
  final bool selected;
  final Function(EmployeeInfo employeeInfo) onEmployeePressed;

  const Employee36aListItem({
    super.key,
    required this.employeeInfo,
    required this.selected,
    required this.onEmployeePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Colors.indigo.withAlpha(30) : null,
      child: ListTile(
        dense: true,
        title: Text(
          employeeInfo.name,
          style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
        ),
        subtitle: Text(
          employeeInfo.empNumber,
          style: const TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
        ),
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
    onEmployeePressed(employeeInfo);
  }
}
