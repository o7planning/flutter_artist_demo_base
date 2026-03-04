import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';

class Employee33aFilterInput extends FilterInput {
  final String? searchText;

  final CompanyTreeItem? company;

  Employee33aFilterInput({required this.searchText, required this.company});

  @override
  String toString() {
    return "searchText: $searchText, company: $company";
  }
}
