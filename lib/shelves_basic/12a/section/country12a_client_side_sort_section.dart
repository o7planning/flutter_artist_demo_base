import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';

class Country12aClientSideSortSection extends StatelessWidget {
  final SortModel<CountryInfo> clientSideSortModel;

  const Country12aClientSideSortSection({
    super.key,
    required this.clientSideSortModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Client Side: ", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 10),
        DropdownSortPanel.simple(sortModel: clientSideSortModel),
        SizedBox(width: 10),
        TextButton(onPressed: _clearCriteria, child: Text("Clear Criteria")),
      ],
    );
  }

  Future<void> _clearCriteria() async {
    await clientSideSortModel.clearAllSorts();
  }
}
