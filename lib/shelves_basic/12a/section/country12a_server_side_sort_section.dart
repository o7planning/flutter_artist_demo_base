import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';

class Country12aServerSideSortSection extends StatelessWidget {
  final SortModel<CountryInfo> serverSideSortModel;

  const Country12aServerSideSortSection({
    super.key,
    required this.serverSideSortModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Server Side: ", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 10),
        DropdownSortPanel.simple(sortModel: serverSideSortModel),
        SizedBox(width: 10),
        TextButton(onPressed: _clearCriteria, child: Text("Clear Criteria")),
      ],
    );
  }

  Future<void> _clearCriteria() async {
    await serverSideSortModel.clearAllSorts();
  }
}
