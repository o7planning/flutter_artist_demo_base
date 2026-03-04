import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/utils/date_utils.dart';

import '../../../model/model.dart';

class EmploymentHistory36aListItem extends StatelessWidget {
  final EmploymentHistoryInfo employmentHistoryInfo;
  final bool selected;
  final Function(EmploymentHistoryInfo employmentHistoryInfo)
  onEmploymentHistoryPressed;

  const EmploymentHistory36aListItem({
    super.key,
    required this.employmentHistoryInfo,
    required this.selected,
    required this.onEmploymentHistoryPressed,
  });

  @override
  Widget build(BuildContext context) {
    DateTime fromDate = employmentHistoryInfo.fromDate;
    DateTime? toDate = employmentHistoryInfo.toDate;

    return Card(
      color: selected ? Colors.indigo.withAlpha(30) : null,
      child: ListTile(
        dense: true,
        title: Text(
          "${dateToString(fromDate)} --> ${toDate == null ? 'Now' : dateToString(toDate)}",
          style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
        ),
        subtitle: Text(
          employmentHistoryInfo.employeePosition.name,
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
    onEmploymentHistoryPressed(employmentHistoryInfo);
  }
}
